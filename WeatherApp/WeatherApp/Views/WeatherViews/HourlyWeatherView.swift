//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

/**
 A view for displaying hourly weather information.

 Use this view to present hourly temperature data for a specific date, typically within the next 24 hours.

 */
struct HourlyWeatherView: View {
    /// The view model containing weather data.
    @ObservedObject var viewModel: WeatherViewModel
    /// The date for which hourly weather data is displayed.
    var date: Date?
    /// A boolean indicating whether the view is embedded within another view.
    var isEmbedded: Bool = false
    
    /// A boolean indicating whether the displayed date is today.
    var isToday: Bool {
        date == nil
    }
    
    /// An array containing hourly temperature data.
    var hourlyTemperatures: [HourlyTemperature] {
        viewModel.getNext24HoursTemperatures(for: date)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !isEmbedded {
                Text("24h").font(.system(size: 20))
            }
            if !isEmbedded {
                Divider()
            }
            if hourlyTemperatures.isEmpty {
                Text("Hourly weather not available")
                    .padding(isEmbedded ? 5 : 24)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: isEmbedded ? 24 : 36) {
                        ForEach(hourlyTemperatures.indices, id: \.self) { index in
                            let hourlyTemp = hourlyTemperatures[index]
                            HourlyItemView(index: index, hourlyTemp: hourlyTemp, isToday: isToday)
                                .id(UUID())
                        }
                    }
                }
            }
        }
        .padding(isEmbedded ? 5 : 24)
    }
}
