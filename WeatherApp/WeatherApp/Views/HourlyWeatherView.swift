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
    
    var body: some View {
        VStack(alignment: .leading) {
            if !isEmbedded {
                Text("24h").font(.system(size: 18))
            }
            if !isEmbedded {
                Divider()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 30) {
                    ForEach(viewModel.getNext24HoursTemperatures(for: date).indices, id: \.self) { index in
                        let hourlyTemp = viewModel.getNext24HoursTemperatures(for: date)[index]
                        HourlyItemView(index: index, hourlyTemp: hourlyTemp, isToday: isToday)
                            .id(UUID())
                    }
                }
            }
        }.padding(isEmbedded ? 5 : 20)
    }
}
