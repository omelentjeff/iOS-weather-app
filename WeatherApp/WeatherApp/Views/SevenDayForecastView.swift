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
                    Button(action: {
                        withAnimation {
                            selectedDailyIndex = selectedDailyIndex == index ? nil : index
                        }
                    }) {
                        DailyItemView(isSelected: selectedDailyIndex == index)
                    }
                    if selectedDailyIndex == index {
                        HourlyWeatherView().background()
                    }
                }
            }.backgroundStyle(.blue.opacity(0.3)).frame(width: 340)
        }.padding(.bottom, 20)
    }
}
