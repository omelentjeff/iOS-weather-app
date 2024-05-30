//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI
import Charts

/**
 A view for displaying the seven-day weather forecast.

 Use this view to visualize the seven-day weather forecast, including maximum and minimum temperatures, sunrise and sunset times, and weather codes.

 */
struct SevenDayForecastView: View {
    /// The view model containing weather data.
    @ObservedObject var viewModel: WeatherViewModel
    /// The index of the selected daily forecast.
    @State private var selectedDailyIndex: Int? = nil
    /// A boolean indicating whether the hourly weather view is visible.
    @State private var isHourlyViewVisible: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ChartView(viewModel: viewModel).padding()
                
                GroupBox("7 Days") {
                    let temperatures = viewModel.getSevenDaysTemperatures()
                    
                    ForEach(0..<7, id: \.self) { index in
                        let maxTemperatures = temperatures.maxTemperatures
                        let minTemperatures = temperatures.minTemperatures
                        let sunrises = temperatures.sunrise
                        let sunsets = temperatures.sunset
                        let weatherCodes = temperatures.weatherCodes
                        let dates = temperatures.dates
                        let dateString = dates[index].toString(format: "yyyy-MM-dd")
                        let weekday = getWeekday(from: dateString) ?? "Unknown"
                        
                        VStack {
                            Divider()
                            Spacer()
                            DailyItemView(weekday: weekday, maxTemperature: maxTemperatures[index], minTemperature: minTemperatures[index], sunrise: sunrises[index], sunset: sunsets[index], weatherCode: weatherCodes[index], isSelected: selectedDailyIndex == index, buttonAction: {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    if self.selectedDailyIndex == index {
                                        self.selectedDailyIndex = nil
                                        self.isHourlyViewVisible = false
                                    } else {
                                        self.selectedDailyIndex = index
                                        self.isHourlyViewVisible = true
                                    }
                                }
                            }).padding(.top, isHourlyViewVisible ? 0 : 20)
                            
                            if selectedDailyIndex == index {
                                HourlyWeatherView(viewModel: viewModel, date: dates[index], isEmbedded: true)
                            }
                        }.padding()
                    }
                }//.background(Color.blue.opacity(0.2))
                
            }
        }
    }
}

/**
 Retrieves the weekday from the given date string.

 - Parameters:
    - dateString: The date string in the format "yyyy-MM-dd".

 - Returns: The weekday abbreviation (e.g., "Mon", "Tue") or nil if the conversion fails.
 */
func getWeekday(from dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    if let date = dateFormatter.date(from: dateString) {
        let calendar = Calendar.current
        let weekdayIndex = calendar.component(.weekday, from: date)
        
        let weekdaySymbols = calendar.weekdaySymbols
        let weekday = weekdaySymbols[weekdayIndex - 1]
        return String(weekday.prefix(3))
    }
    return nil
}
