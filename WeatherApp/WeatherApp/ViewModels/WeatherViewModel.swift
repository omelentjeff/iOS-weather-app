//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI


class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var selectedDate: Date?
    
    var latitude: Double?
    var longitude: Double?
    
    func fetchWeather(for date: Date) {
        print("Selected Date:", date)
        
        Task {
            do {
                let weather = try await getWeather(for: date)
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
    
    func getWeather(for date: Date) async throws -> WeatherData {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        let endpoint = "https://api.open-meteo.com/v1/forecast?latitude=61.4991&longitude=23.7871&current_date=\(dateString)&current=temperature_2m,apparent_temperature&hourly=temperature_2m&daily=temperature_2m_max,temperature_2m_min&timezone=auto"
        
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
    
    /*func getNext24HoursTemperatures(for date: Date) -> [Double] {
        guard let hourlyTemps = weatherData?.hourly.temperature2M,
              let hourlyTimes = weatherData?.hourly.time else { return [] }
        
        /*for (index, timeString) in hourlyTimes.enumerated() {
            print("Index: \(index), Date String: \(timeString)")
        }*/
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withFullDate, .withDashSeparatorInDate, .withColonSeparatorInTime, .withTime]
        
        var next24HoursTemps: [Double] = []
        
        for (index, timeString) in hourlyTimes.enumerated() {
            if let timeDate = isoFormatter.date(from: timeString),
               timeDate >= startOfDay && timeDate < endOfDay {
                print(timeDate)
                next24HoursTemps.append(hourlyTemps[index])
            } else {
                //print("wrong")
            }
        }
        
        /*for (index, timeString) in hourlyTimes.enumerated() {
            print("Index: \(index), Date String: \(type(of: timeString))")
        }*/
        
        return next24HoursTemps
    }*/
    
    func getNext24HoursTemperatures() -> [Double] {
        guard let hourlyTemps = weatherData?.hourly.temperature2M else { return [] }
        
        // Find the index of the current hour
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH"
        let currentDateHourString = dateFormatter.string(from: Date())
        let currentDateString = currentDateHourString + ":00"
        print("Current Date String: \(currentDateString)")
        
        weatherData?.hourly.time.forEach { print($0) }
        
        guard let currentIndex = weatherData?.hourly.time.firstIndex(of: currentDateString) else { return [] }
        print("Current Index: \(currentIndex)")
        
        let endIndex = min(currentIndex + 24, hourlyTemps.count)
        let slicedTemps = Array(hourlyTemps[currentIndex..<endIndex])
        return slicedTemps
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
    
    func updateDate(for date: Date) {
        if let selectedDate = selectedDate {
            fetchWeather(for: selectedDate)
        }
    }
}
