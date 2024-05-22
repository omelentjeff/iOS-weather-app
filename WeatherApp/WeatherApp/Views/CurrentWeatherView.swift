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
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(String(format: "%.1f", weatherData.current.temperature2M)).font(.system(size: 20)).padding()
                Spacer()
            }/*
              HStack {
              Text(item.temp).font(.system(size: 56)).fontWeight(.light).padding(.trailing, 5).bold()
              Image(systemName: item.icon).font(.system(size: 40))//.foregroundStyle(.yellow)
              Spacer()
              }
              }.padding()*/
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
