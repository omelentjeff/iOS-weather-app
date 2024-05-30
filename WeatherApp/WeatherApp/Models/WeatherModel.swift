//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI

/**
 Represents weather data including latitude, longitude, current weather, daily weather, and hourly weather.
 */
struct WeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let current: Current
    let daily: Daily
    let hourly: Hourly
}

/**
 Represents current weather data including temperature and weather code.
 */
struct Current: Codable {
    let temperature2M: Double
    let weatherCode: Int
}

/**
 Represents daily weather data including timestamps, max and min temperatures, sunrise and sunset times, precipitation probability, and weather codes.
 */
struct Daily: Codable {
    let time: [String]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
    let sunrise: [String]
    let sunset: [String]
    let precipitationProbabilityMax: [Int]
    let weatherCode: [Int]
}

/**
 Represents hourly weather data including timestamps, temperatures, and weather codes.
 */
struct Hourly: Codable {
    let time: [String]
    let temperature2M: [Double]
    let weatherCode: [Int]
}

/**
 Represents hourly temperature data including hour, temperature, and weather code.
 */
struct HourlyTemperature {
    let hour: String
    let temperature: Double
    let weatherCode: Int
}

/**
 Represents errors that can occur during weather data retrieval.
 */
enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

/**
 Represents weather icons as string values.
 */
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
    
    /**
     Provides the icon name for a given weather code.

     - Parameter weatherCode: The weather code to get the icon name for.
     - Returns: The icon name corresponding to the provided weather code.
     */
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
