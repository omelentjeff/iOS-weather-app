//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

struct SevenDayForecastView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State private var selectedDailyIndex: Int? = nil
    @State private var isHourlyViewVisible: Bool = false
    @State private var activeRowIndex: Int? = nil
    
    /*ForEach(viewModel.getNext24HoursTemperatures().indices, id: \.self) { index in
        let temperature = viewModel.getNext24HoursTemperatures()[index]
        HourlyItemView(temperature: temperature)
            .id(UUID())
    }*/
    
    var body: some View {
        ScrollView {
            GroupBox("7 Days") {
                let temperaturesTuple = viewModel.getSevenDaysTemperatures()
                
                ForEach(0..<7, id: \.self) { index in
                    let maxTemperatures = temperaturesTuple.maxTemperatures
                    let minTemperatures = temperaturesTuple.minTemperatures
                    
                    VStack {
                        Divider()
                        Spacer()
                        DailyItemView(maxTemperature: maxTemperatures[index], minTemperature: minTemperatures[index], isSelected: selectedDailyIndex == index, buttonAction: {
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
                                HourlyWeatherView(viewModel: viewModel, isEmbedded: true)
                            }
                        }
                    }.padding()//.background(index == activeRowIndex && isHourlyViewVisible ? Color.blue.opacity(0.2) : Color.clear).clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }.backgroundStyle(.blue.opacity(0.2))//.frame(width: 340)
        }
    }
}
