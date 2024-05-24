//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    var coordinates: CLLocationCoordinate2D
    var weatherData: WeatherData
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Pirkkala").font(.system(size: 22))
            HStack(spacing: 10) {
                Text(String(format: "%.1f°", weatherData.current.temperature2M)).font(.system(size: 50))
                Image(systemName: "sun.max").font(.system(size: 40)).padding(.trailing, 20)//.foregroundStyle(.yellow)
                VStack {
                    Text("H: 25")
                    Text("L: 10")
                }
            }
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
