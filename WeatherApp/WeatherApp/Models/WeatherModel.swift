//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI

struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let current: Current
}

struct Current: Codable {
    let temperature2M: Double
}

enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
