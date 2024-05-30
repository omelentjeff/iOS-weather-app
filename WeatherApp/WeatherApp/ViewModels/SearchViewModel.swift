//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI
import Combine

/**
 A view model responsible for handling search functionality and fetching search results from the Open Meteo Geocoding API.

 Use this view model to perform search operations, debounce user input, and manage the loading state of search operations.
*/
class SearchViewModel: ObservableObject {
    /// The search data containing the search results.
    @Published var searchData: SearchData?
    /// The current value of the search query.
    @Published var currentValue: String
    /// The debounced value of the search query.
    @Published var debouncedValue: String
    /// A boolean indicating whether the search operation is currently loading.
    @Published var loading: Bool = false
    /// The subscriber for debouncing the search query.
    private var subscriber: AnyCancellable?
    
    /**
     Initializes the SearchViewModel with the specified initial value and debounce delay.
     
     - Parameters:
        - initialValue: The initial value of the search query.
        - delay: The debounce delay for the search query.
     */
    init(initialValue: String, delay: Double = 0.3 ) {
        _currentValue = Published(initialValue: initialValue)
        _debouncedValue = Published(initialValue: initialValue)
        subscriber = $currentValue
            .debounce(for: .seconds(delay), scheduler: RunLoop.main)
            .sink { [unowned self] value in
                self.debouncedValue = value
            }
    }
    
    /**
     Sets up the debouncing for the search query.
     */
    func setupSearchDebounce() {
        debouncedValue = self.currentValue
        $currentValue
            .debounce(for: .seconds(0.75), scheduler: RunLoop.main)
            .assign(to: &$debouncedValue)
    }
        
    /**
     Fetches search results for the specified query.
     
     - Parameters:
        - query: The search query.
     */
    func fetchSearchResults(for query: String) {
        if query.isEmpty {
            self.searchData = nil
            return
        }
        
        self.loading = true
        
        Task {
            do {
                let search = try await getSearchResults(for: query)
                DispatchQueue.main.async {
                   if search.results.isEmpty {
                       self.searchData = SearchData(results: []) // Set to empty results
                   } else {
                       self.searchData = search
                   }
                   self.loading = false
               }
            } catch {
                DispatchQueue.main.async {
                   self.searchData = SearchData(results: []) // Set to empty results on error
                   self.loading = false
               }
                print(error)
            }
        }
    }
    
    /**
     Fetches search results for the specified query asynchronously.
     
     - Parameters:
        - query: The search query.
     
     - Returns: A SearchData object containing the search results.
     - Throws: An error if the search operation fails.
     */
    func getSearchResults(for query: String) async throws -> SearchData {
        let endpoint = "https://geocoding-api.open-meteo.com/v1/search?name=\(query)&count=10&language=en&format=json"
        
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
