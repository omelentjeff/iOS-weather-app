//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchData: SearchData?
    
    func fetchSearchResults(for date: Date) {
        print("Selected Date:", date)
        
        Task {
            do {
                let search = try await getSearchResults()
                DispatchQueue.main.async {
                    self.searchData = search
                    print("Loaded")
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getSearchResults() async throws -> SearchData {
        let endpoint = "https://geocoding-api.open-meteo.com/v1/search?name=tampere&count=10&language=en&format=json"
        
        guard let url = URL(string: endpoint) else { throw SearchError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw SearchError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(SearchData.self, from: data)
        } catch {
            throw SearchError.invalidData
        }
    }
}
