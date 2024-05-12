//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

struct SevenDayForecastView: View {
    var body: some View {
        ScrollView {
            GroupBox("7 Days") {
                ForEach(1...20, id: \.self) { _ in
                    Divider()
                    DailyItemView()
                }
            }.backgroundStyle(.blue.opacity(0.3)).frame(width: 340)
        }
    }
}
