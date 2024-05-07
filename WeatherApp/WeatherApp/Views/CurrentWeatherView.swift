//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        Text("Pirkkala").font(.system(size: 32)).foregroundStyle(.blue).padding()
        Text("Weather Now")
        HStack {
            Spacer()
            Image(systemName: "sun.max.fill").font(.system(size: 42)).foregroundStyle( Color.yellow)
            Spacer()
            Text("28°").font(.system(size: 36))
            Spacer()
        }.padding()
    }
}

#Preview {
    CurrentWeatherView()
}
