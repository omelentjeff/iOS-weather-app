//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var isEmbedded: Bool = false
    
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
                    ForEach(viewModel.getNext24HoursTemperatures(), id: \.self) { temperature in
                        HourlyItemView(temperature: temperature)
                    }
                }
            }
        }.padding(isEmbedded ? 5 : 20)
    }
}
