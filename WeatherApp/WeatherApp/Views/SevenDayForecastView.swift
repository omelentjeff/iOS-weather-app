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
    @State private var activeRowIndex: Int? = nil
    
    var body: some View {
        ScrollView {
            GroupBox("7 Days") {
                ForEach(1...20, id: \.self) { index in
                    VStack {
                        Divider()
                        Spacer()
                        DailyItemView(isSelected: selectedDailyIndex == index, buttonAction: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                if self.selectedDailyIndex == index {
                                    self.selectedDailyIndex = nil
                                    self.isHourlyViewVisible = false
                                    self.activeRowIndex = nil
                                } else {
                                    self.selectedDailyIndex = index
                                    self.isHourlyViewVisible = true
                                    self.activeRowIndex = index
                                }
                            }
                        }).padding(.top, isHourlyViewVisible ? 0 : 20)
                        
                        if selectedDailyIndex == index {
                            if isHourlyViewVisible {
                                HourlyWeatherView(isEmbedded: true)
                            }
                        }
                    }.padding().background(index == activeRowIndex && isHourlyViewVisible ? Color.blue.opacity(0.2) : Color.clear).clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }.backgroundStyle(.blue.opacity(0.2))//.frame(width: 340)
        }
    }
}
