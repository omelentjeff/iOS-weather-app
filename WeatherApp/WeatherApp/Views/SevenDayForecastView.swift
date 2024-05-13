//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

struct SevenDayForecastView: View {
    @State private var selectedDailyIndex: Int? = nil
    @State private var isHourlyViewVisible: Bool = false
    
    var body: some View {
        ScrollView {
            GroupBox("7 Days") {
                ForEach(1...20, id: \.self) { index in
                    Divider()
                    DailyItemView(isSelected: selectedDailyIndex == index, buttonAction: {
                        if self.selectedDailyIndex == index {
                                self.selectedDailyIndex = nil
                                self.isHourlyViewVisible = false
                            } else {
                                self.selectedDailyIndex = index
                                self.isHourlyViewVisible = true
                            }
                    })
                    
                    if selectedDailyIndex == index {
                        if isHourlyViewVisible {
                            HourlyWeatherView()
                        }
                    }
                }
            }.backgroundStyle(.blue.opacity(0.3)).frame(width: 340)
        }
    }
}
