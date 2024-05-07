//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

struct SevenDayForecastView: View {
    var body: some View {
        GroupBox(label:
                    Label("7 Day Forecast", systemImage: "sune").foregroundStyle(.blue)
        ) {
            HStack {
                Spacer()
                Image(systemName: "sun.max.fill").font(.system(size: 42)).foregroundStyle( Color.yellow)
                Spacer()
                Text("28°").font(.system(size: 36))
                Spacer()
            }.padding()
        }.padding()
    }
}
