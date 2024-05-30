//
//  SevenDayForecastView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI
import Charts

struct SevenDayForecastView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State private var selectedDailyIndex: Int? = nil
    @State private var isHourlyViewVisible: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ChartView(viewModel: viewModel).padding()
                
                GroupBox("7 Days") {
                    let temperatures = viewModel.getSevenDaysTemperatures()
                    
                    ForEach(0..<7, id: \.self) { index in
                        let maxTemperatures = temperatures.maxTemperatures
                        let minTemperatures = temperatures.minTemperatures
                        let sunrises = temperatures.sunrise
                        let sunsets = temperatures.sunset
                        let dates = temperatures.dates
                        let dateString = dates[index].toString(format: "yyyy-MM-dd")
                        let weekday = getWeekday(from: dateString) ?? "Unknown"
                        
                        VStack {
                            Divider()
                            Spacer()
                            DailyItemView(weekday: weekday, maxTemperature: maxTemperatures[index], minTemperature: minTemperatures[index], sunrise: sunrises[index], sunset: sunsets[index], isSelected: selectedDailyIndex == index, buttonAction: {
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
    
    /*@ViewBuilder
    private func rainProbabilityChart() -> some View {
        let rainProbabilities = viewModel.getSevenDaysRainProbabilities()
        let dates = viewModel.getSevenDaysTemperatures().dates
        
        
        
        VStack {
            Text("Rain Probability Chart")
                .font(.title)
                .padding(.bottom, 10)
            
            
            
            Chart {
                ForEach(0..<rainProbabilities.count, id: \.self) { index in
                    LineMark(
                        x: .value("Date", dates[index], unit: .day),
                        y: .value("Rain Probability", rainProbabilities[index])
                    )
                    .symbol(.circle)
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { value in
                    AxisValueLabel {
                        if let dateValue = value.as(Date.self) {
                            Text(dateValue, format: Date.FormatStyle().day())
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(values: [0, 20, 40, 60, 80, 100]) { value in
                    AxisValueLabel {
                        Text("\(value.as(Int.self) ?? 0)%")
                    }
                }
            }
            .frame(height: 200)
        }
    }*/
}

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

/*struct LineChartView: View {
    var viewModel: WeatherViewModel
    
    
    var body: some View {
        let rainProbabilities = viewModel.getSevenDaysRainProbabilities()
        let dates = viewModel.getSevenDaysTemperatures().dates
        
        // oma struct näille
            VStack {
                Chart {
                    if let weatherData = viewModel.weatherData {
                        ForEach(rainProbabilities) { item in
                            LineMark(
                                x: .value("Month", item.date),
                                y: .value("Temp", item.temperature)
                            )
                        }
                    } else {
                        Text("Jotain")
                    }
                }
                .frame(height: 300)
            }
        }
}
*/
