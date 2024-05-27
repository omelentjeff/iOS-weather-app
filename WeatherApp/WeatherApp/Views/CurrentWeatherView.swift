//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    var weatherData: WeatherData
    var locationTitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(locationTitle).font(.system(size: 22))
            HStack(spacing: 10) {
                Text(String(format: "%.0f°", weatherData.current.temperature2M)).font(.system(size: 50))
                Image(systemName: "sun.max").font(.system(size: 40)).padding(.trailing, 20)//.foregroundStyle(.yellow)
                VStack(spacing: 5) {
                   if let maxTemperature = weatherData.daily.temperature2MMax.first {
                       Text(String(format: "H: %.0f°", maxTemperature))
                           .font(.system(size: 16))
                   }

                   if let minTemperature = weatherData.daily.temperature2MMin.first {
                       Text(String(format: "L: %.0f°", minTemperature))
                           .font(.system(size: 16))
                   }
               }
            }.padding()
        }
    }
}

func getFormattedDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.string(from: Date())
}

func getWeekday() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: Date())
}
