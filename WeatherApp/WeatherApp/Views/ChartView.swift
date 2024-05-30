//
//  ChartView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State private var rainData: [RainData] = []

    var body: some View {
        VStack {
            Text("Rain %").font(.system(size: 18))
            Chart {
                ForEach(rainData) { item in
                    LineMark(
                        x: PlottableValue.value("Date", item.date),
                        y: PlottableValue.value("%", item.rainProbability)
                    ).symbol(.circle)
                }
            }.chartYScale(domain: 0...100)
                .frame(height: 300)
        }
        .onAppear {
            self.rainData = self.viewModel.getSevenDaysRainProbabilities()
        }
    }
}
