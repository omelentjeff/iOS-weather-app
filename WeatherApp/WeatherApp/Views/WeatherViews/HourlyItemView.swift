//
//  HourlyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

/**
 A view for displaying hourly weather item.

 Use this view to present details of hourly weather data, including hour, weather icon, and temperature.
 */
struct HourlyItemView: View {
    /// The index of the hourly item.
    var index: Int
    /// The hourly temperature data.
    var hourlyTemp: HourlyTemperature
    /// A boolean indicating whether the displayed date is today.
    var isToday: Bool
    /// A boolean indicating whether the view is embedded within another view.
    var isEmbedded: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text(index == 0 && isToday ? "Now" : hourlyTemp.hour)
            let iconName = WeatherIcon.iconName(for: hourlyTemp.weatherCode)
            Image(systemName: iconName)
            Text(String(format: "%.0f°", hourlyTemp.temperature))
                .font(.system(size: isEmbedded ? 16 : 18)).bold()
        }
    }
}
