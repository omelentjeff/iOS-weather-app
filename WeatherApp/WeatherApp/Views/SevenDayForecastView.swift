//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

struct SevenDayForecastView: View {
    @State private var selectedDailyIndex: Int? = nil
    var body: some View {
        ScrollView {
            GroupBox("7 Days") {
                ForEach(1...20, id: \.self) { index in
                    Divider()
                    DailyItemView(isSelected: selectedDailyIndex == index).onTapGesture {
                        selectedDailyIndex = selectedDailyIndex == index ? nil : index
                    }
                    
                    if selectedDailyIndex == index {
                        HourlyWeatherView()
                    }
                }
            }.backgroundStyle(.blue.opacity(0.3)).frame(width: 340)
        }
    }
}
