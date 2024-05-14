//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyWeatherView: View {
    var body: some View {
        GroupBox("24h") {
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 35) {
                    ForEach(1...20, id: \.self) { _ in
                        HourlyItemView()
                    }
                }
            }
        }.frame(width: 340).backgroundStyle(.blue.opacity(0.3))
    }
}
