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
    let daily: Daily
    let hourly: Hourly
}

struct Current: Codable {
    let temperature2M: Double
}

struct Daily: Codable {
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
}

struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
}

enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
