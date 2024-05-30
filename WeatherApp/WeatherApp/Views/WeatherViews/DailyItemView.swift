//
//  DailyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 11.5.2024.
//

import SwiftUI

/**
 A view for displaying daily weather item.

 Use this view to present details of daily weather data, including weekday, maximum and minimum temperatures, sunrise and sunset times, and weather icon.
 */
struct DailyItemView: View {
    /// The weekday string.
    let weekday: String
    /// The maximum temperature for the day.
    let maxTemperature: Double
    /// The minimum temperature for the day.
    let minTemperature: Double
    /// The sunrise time.
    let sunrise: String
    /// The sunset time.
    let sunset: String
    /// The weather code representing the weather condition.
    let weatherCode: Int
    /// A boolean indicating whether the item is selected.
    let isSelected: Bool
    /// The action to be performed when the item is tapped.
    let buttonAction: () -> Void
    /// The rotation angle for the chevron icon.
    @State private var rotationAngle = Angle(degrees: 0)
    
    var body: some View {
        HStack {
            Text(weekday).font(.system(size: 18))
                .frame(width: 50, alignment: .leading)
            let iconName = WeatherIcon.iconName(for: weatherCode)
            Image(systemName: iconName).font(.system(size: 20))
                //.frame(width: 30)
            Spacer()
            VStack(spacing: 10) {
                HStack(spacing: 40) {
                    Text(String(format: "H: %.0f°", maxTemperature))
                        .font(.system(size: 16))
                    Text(String(format: "L: %.0f°", minTemperature))
                        .font(.system(size: 16))
                }
                if isSelected {
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(systemName: "sunrise").font(.system(size: 16))
                            Text(sunrise).font(.system(size: 16))
                    }
                        HStack(spacing: 5) {
                            Image(systemName: "sunset").font(.system(size: 16))
                            Text(sunset).font(.system(size: 16))
                        }
                    }
                }
            }
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.buttonAction()
                }
            }) {
                Image(systemName: "chevron.down").rotationEffect(isSelected ? .degrees(180) : .degrees(0))
            }.padding(.leading, 30)
        }//.padding()
    }
}
