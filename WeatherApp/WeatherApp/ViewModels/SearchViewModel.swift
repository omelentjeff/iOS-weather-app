//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchData: SearchData?
    @Published var currentValue: String
    @Published var debouncedValue: String
    
    private var subscriber: AnyCancellable?
    
    init(initialValue: String, delay: Double = 0.3 ) {
        _currentValue = Published(initialValue: initialValue)
        _debouncedValue = Published(initialValue: initialValue)
        subscriber = $currentValue
            .debounce(for: .seconds(delay), scheduler: RunLoop.main)
            .sink { [unowned self] value in
                self.debouncedValue = value
            }
    }
    
    func setupSearchDebounce() {
        debouncedValue = self.currentValue
        $currentValue
            .debounce(for: .seconds(0.75), scheduler: RunLoop.main)
            .assign(to: &$debouncedValue)
    }
        
      
    
    func fetchSearchResults(for query: String) {
        if query.isEmpty {
            self.searchData = nil
            return
        }
        
        Task {
            do {
                let search = try await getSearchResults(for: query)
                DispatchQueue.main.async {
                    self.searchData = search
                    print("Loaded search results")
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getSearchResults(for query: String) async throws -> SearchData {
        let endpoint = "https://geocoding-api.open-meteo.com/v1/search?name=\(query)&count=10&language=en&format=json"
        
        guard let url = URL(string: endpoint) else { throw SearchError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw SearchError.invalidResponse
        }
        
        print("Received data:", String(data: data, encoding: .utf8) ?? "Data could not be converted to UTF-8 string")
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(SearchData.self, from: data)
        } catch {
            throw SearchError.invalidData
        }
    }
}
