//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 22.5.2024.
//

import SwiftUI


class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    var latitude: Double?
    var longitude: Double?

    
    func fetchWeather() {
        Task {
            do {
                let weather = try await getWeather()
                weatherData = weather
                latitude = weather.latitude
                longitude = weather.longitude
            } catch {
                print(error)
            }
        }
    }
    
    func getWeather() async throws -> WeatherData {
        let endpoint = "https://api.open-meteo.com/v1/forecast?latitude=61.4991&longitude=23.7871&current=temperature_2m&hourly=temperature_2m&daily=temperature_2m_max,temperature_2m_min&timezone=auto"
        
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
}
