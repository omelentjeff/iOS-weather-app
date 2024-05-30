//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI
import CoreLocation

/**
 Contains the view model class for managing weather-related data and operations.
 */
class WeatherViewModel: ObservableObject {
    /// Published property holding weather data.
    @Published var weatherData: WeatherData?
    /// Published property holding the selected date.
    @Published var selectedDate: Date?
    /// Published property indicating loading state.
    @Published var loading: Bool = false
    
    /// Observed object for managing caching operations.
    @ObservedObject var cacheViewModel = CacheViewModel()
    
    /// Latitude coordinate.
    var latitude: Double?
    /// Longitude coordinate.
    var longitude: Double?
    
    /**
     Fetches weather data for a given date and coordinates.

     - Parameters:
        - date: The date for which weather data is requested.
        - coordinates: The coordinates for which weather data is requested.
     */
    func fetchWeather(for date: Date, coordinates: CLLocationCoordinate2D) {
        self.loading = true
        
        Task {
            do {
                // Attempt to get weather data from cache
                if let cachedData = cacheViewModel.getFromCache(latitude: coordinates.latitude, longitude: coordinates.longitude) {
                    DispatchQueue.main.async {
                        self.weatherData = cachedData
                        self.selectedDate = date
                        if let latitude = self.weatherData?.latitude,
                            let longitude = self.weatherData?.longitude {
                            self.loading = false
                            print("ViewModel Loaded weather \(latitude) \(longitude) from cache")
                        } else {
                            print("Loaded weather from cache, but latitude or longitude is missing.")
                        }
                    }
                } else {
                    // Data not found in cache, fetch from API
                    let weather = try await getWeather(coordinates: coordinates)
                    DispatchQueue.main.async {
                        self.weatherData = weather
                        self.selectedDate = date
                        if let latitude = self.weatherData?.latitude,
                            let longitude = self.weatherData?.longitude {
                            self.loading = false
                            print("ViewModel Loaded weather \(latitude) \(longitude) from API")
                        } else {
                            print("Loaded weather from API, but latitude or longitude is missing.")
                        }
                        // Cache the fetched data
                        self.cacheViewModel.saveToCache(data: weather, latitude: coordinates.latitude, longitude: coordinates.longitude)
                    }
                }
                }  catch {
                print(error)
            }
        }
    }
    
    /**
     Fetches weather data for a given coordinates.

     - Parameter coordinates: The coordinates for which weather data is requested.
     - Returns: The fetched weather data.
     */
    func getWeather(coordinates: CLLocationCoordinate2D) async throws -> WeatherData {
        let endpoint = "https://api.open-meteo.com/v1/forecast?latitude=\(coordinates.latitude)&longitude=\(coordinates.longitude)&current=weather_code,temperature_2m,apparent_temperature&hourly=weather_code,temperature_2m&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_probability_max&timezone=auto"
        
        guard let url = URL(string: endpoint) else { throw WeatherError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WeatherError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            throw WeatherError.invalidData
        }
    }
    
    /**
     Retrieves the next 24 hours temperatures.

     - Parameter date: The date for which temperatures are requested. Defaults to nil.
     - Returns: An array of `HourlyTemperature` objects representing temperatures for the next 24 hours.
     */
    func getNext24HoursTemperatures(for date: Date? = nil) -> [HourlyTemperature] {
        guard let hourlyTemps = weatherData?.hourly.temperature2M,
              let weatherCodes = weatherData?.hourly.weatherCode else { return [] }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH"
        
        var currentDate = Date()
        if let selectedDate = date {
            currentDate = selectedDate
        }
        
        let currentDateHourString = dateFormatter.string(from: currentDate)
        let currentDateString = currentDateHourString + ":00"
        
        guard let currentIndex = weatherData?.hourly.time.firstIndex(of: currentDateString) else { return [] }
        
        var hourlyTemperatures: [HourlyTemperature] = []
        
        for i in currentIndex..<min(currentIndex + 24, hourlyTemps.count) {
            let fullHourString = weatherData?.hourly.time[i] ?? ""
            let hour = fullHourString.components(separatedBy: "T")[1].components(separatedBy: ":")[0]
            let temperature = hourlyTemps[i]
            let weatherCode = weatherCodes[i]
            let hourlyTemp = HourlyTemperature(hour: hour, temperature: temperature, weatherCode: weatherCode)
            hourlyTemperatures.append(hourlyTemp)
       }
        
        return hourlyTemperatures
    }


    /**
     Retrieves weather data for the next seven days.

     - Returns: A tuple containing arrays of dates, sunrise times, sunset times, weather codes, maximum temperatures, and minimum temperatures for the next seven days.
     */
    func getSevenDaysTemperatures() -> (dates: [Date], sunrise: [String], sunset: [String], weatherCodes: [Int], maxTemperatures: [Double], minTemperatures: [Double]) {
        guard let dateStringArray = weatherData?.daily.time,
              let sunriseArray = weatherData?.daily.sunrise,
              let sunsetArray = weatherData?.daily.sunset,
              let weatherCodes = weatherData?.daily.weatherCode,
              let maxTemperature = weatherData?.daily.temperature2MMax,
              let minTemperature = weatherData?.daily.temperature2MMin else { return ([], [], [], [], [], []) }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
           
        // Convert string dates to Date objects
        let dates = dateStringArray.compactMap { dateFormatter.date(from: $0) }
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'H:mm"
            
        let sunrise = getHoursFormatted(stringArray: sunriseArray)
        let sunset = getHoursFormatted(stringArray: sunsetArray)
        
        return (dates, sunrise, sunset, weatherCodes, maxTemperature, minTemperature)
    }
    
    /**
     Retrieves weather data for the next seven days.

     - Returns: A tuple containing arrays of dates, sunrise times, sunset times, weather codes, maximum temperatures, and minimum temperatures for the next seven days.
     */
    func getSevenDaysRainProbabilities() -> [RainData] {
        guard let precipitations = weatherData?.daily.precipitationProbabilityMax else { return [] }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Extracting dates from weather data
        guard let dateStringArray = weatherData?.daily.time else { return [] }
        let dates = dateStringArray.compactMap { dateFormatter.date(from: $0) }
        
        // Creating an array of RainData objects
        var rainData: [RainData] = []
        for (index, probability) in precipitations.enumerated() {
            let date = dates.indices.contains(index) ? dates[index] : Date()
            let rainDatum = RainData(rainProbability: probability, date: date.toString(format: "MM-dd"))
            rainData.append(rainDatum)
        }
        
        return rainData
    }
    
    /**
     Retrieves the name of the weather icon corresponding to the provided weather code.

     - Parameter weatherCode: The weather code for which the icon name is requested.
     - Returns: The name of the weather icon corresponding to the provided weather code.
     */
    func getWeatherIcon(for weatherCode: Int) -> String {
       return WeatherIcon.iconName(for: weatherCode)
   }
}

/**
 Represents data about rain probability for a specific date.
 */
struct RainData: Codable, Identifiable {
    var id = UUID()
    var rainProbability: Int
    var date: String
}

