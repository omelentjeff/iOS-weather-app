//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI
import CoreLocation


class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var selectedDate: Date?
    
    var latitude: Double?
    var longitude: Double?
    
    func fetchWeather(for date: Date, coordinates: CLLocationCoordinate2D) {
        Task {
            do {
                let weather = try await getWeather(coordinates: coordinates)
                DispatchQueue.main.async {
                    self.weatherData = weather
                    self.selectedDate = date
                    print("Loaded")
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getWeather(coordinates: CLLocationCoordinate2D) async throws -> WeatherData {
        let endpoint = "https://api.open-meteo.com/v1/forecast?latitude=\(coordinates.latitude)&longitude=\(coordinates.longitude)&current=temperature_2m,apparent_temperature&hourly=temperature_2m&daily=temperature_2m_max,temperature_2m_min&timezone=auto"
        
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
    
    func getNext24HoursTemperatures(for date: Date? = nil) -> [HourlyTemperature] {
        guard let hourlyTemps = weatherData?.hourly.temperature2M else { return [] }
        
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
           let hourlyTemp = HourlyTemperature(hour: hour, temperature: temperature)
           hourlyTemperatures.append(hourlyTemp)
       }
        
        return hourlyTemperatures
    }


    
    func getSevenDaysTemperatures() -> (dates: [Date], maxTemperatures: [Double], minTemperatures: [Double]) {
        guard let dateStringArray = weatherData?.daily.time,
              let maxTemperature = weatherData?.daily.temperature2MMax,
              let minTemperature = weatherData?.daily.temperature2MMin else { return ([], [], []) }
        
        let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           
           // Convert string dates to Date objects
           let dates = dateStringArray.compactMap { dateFormatter.date(from: $0) }
        
        return (dates, maxTemperature, minTemperature)
    }
}
