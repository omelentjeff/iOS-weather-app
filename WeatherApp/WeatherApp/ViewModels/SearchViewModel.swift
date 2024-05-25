//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchData: SearchData?
    
    func fetchSearchResults(for query: String) {
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
