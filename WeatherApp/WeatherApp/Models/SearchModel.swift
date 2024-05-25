//
//  SearchModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI

struct SearchData: Codable {
    let results: [SearchResult]
}

struct SearchResult: Codable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String
}

enum SearchError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
