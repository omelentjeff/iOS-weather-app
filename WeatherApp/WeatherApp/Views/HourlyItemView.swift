//
//  HourlyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyItemView: View {
    var index: Int
    var hourlyTemp: HourlyTemperature
    var isToday: Bool
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
