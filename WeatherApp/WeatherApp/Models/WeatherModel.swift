//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI

struct WeatherData: Codable, Identifiable {
    var id = UUID()
    let latitude: Double
    let longitude: Double
    let current: Current
    let daily: Daily
    let hourly: Hourly
}

struct Current: Codable {
    let temperature2M: Double
    let weatherCode: Int
}

struct Daily: Codable {
    let time: [String]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
    let sunrise: [String]
    let sunset: [String]
    let precipitationProbabilityMax: [Int]
    let weatherCode: [Int]
}

struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    let weatherCode: [Int]
}

struct HourlyTemperature {
    let hour: String
    let temperature: Double
    let weatherCode: Int
}

enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

enum WeatherIcon: String {
    case clearSky = "sun.max"
    case mainlyClear = "cloud.sun"
    case overcast = "smoke"
    case fog = "cloud.fog"
    case drizzleLight = "cloud.drizzle"
    case rain = "cloud.rain"
    case rainHeavy = "cloud.heavyrain"
    case snowFallSlight = "cloud.snow"
    case thunderstormSlightOrModerate = "cloud.bolt"
    case thunderstormWithHail = "cloud.bolt.rain"
    
    static func iconName(for weatherCode: Int) -> String {
        switch weatherCode {
        case 0:
            return WeatherIcon.clearSky.rawValue
        case 1, 2:
            return WeatherIcon.mainlyClear.rawValue
        case 3:
            return WeatherIcon.overcast.rawValue
        case 45, 48:
            return WeatherIcon.fog.rawValue
        case 51...57:
            return WeatherIcon.drizzleLight.rawValue
        case 56, 67, 80...82:
            return WeatherIcon.rain.rawValue
        case 61...65:
            return WeatherIcon.rainHeavy.rawValue
        case 71...86:
            return WeatherIcon.snowFallSlight.rawValue
        case 95:
            return WeatherIcon.thunderstormSlightOrModerate.rawValue
        case 96, 99:
            return WeatherIcon.thunderstormWithHail.rawValue
        default:
            return WeatherIcon.overcast.rawValue
        }
    }
}
