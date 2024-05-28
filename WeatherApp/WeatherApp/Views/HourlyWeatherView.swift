//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var date: Date?
    var isEmbedded: Bool = false
    
    var isToday: Bool {
        date == nil
    }
    
    var hourlyTemperatures: [HourlyTemperature] {
        viewModel.getNext24HoursTemperatures(for: date)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !isEmbedded {
                Text("24h").font(.system(size: 18))
            }
            if !isEmbedded {
                Divider()
            }
            if hourlyTemperatures.isEmpty {
                Text("Hourly weather not available")
                    .padding(isEmbedded ? 5 : 20)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 38') {
                        ForEach(hourlyTemperatures.indices, id: \.self) { index in
                            let hourlyTemp = hourlyTemperatures[index]
                            HourlyItemView(index: index, hourlyTemp: hourlyTemp, isToday: isToday)
                                .id(UUID())
                        }
                    }
                }
            }
        }.padding(isEmbedded ? 5 : 20)
    }
}
