//
//  SearchModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI

/**
 Represents search data including an array of search results.
 */
struct SearchData: Codable {
    let results: [SearchResult]
}

/**
 Represents a search result including its ID, name, latitude, longitude, and country.
 */
struct SearchResult: Codable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String
}

/**
 Represents errors that can occur during search operations.
 */
enum SearchError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
