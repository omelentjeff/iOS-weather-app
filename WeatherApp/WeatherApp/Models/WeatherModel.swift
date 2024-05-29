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
    let time: [String]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
    let weatherCode: [Int]
    let sunrise: [String]
    let sunset: [String]
    let precipitationProbabilityMax: [Int]
}

struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
}

struct HourlyTemperature {
    let hour: String
    let temperature: Double
}

enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
