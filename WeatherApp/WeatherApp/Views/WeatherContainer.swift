//
//  WeatherContainer.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 12.5.2024.
//

import SwiftUI
import CoreLocation

struct WeatherContainer: View {
    var coordinates: CLLocationCoordinate2D
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack {
                    if let weatherData = viewModel.weatherData {
                        CurrentWeatherView(weatherData: weatherData).padding(.bottom, 40)
                        HourlyWeatherView(viewModel: viewModel).padding(.bottom, 40)
                        SevenDayForecastView(viewModel: viewModel)
                    } else {
                        Text("Loading...")
                    }
                }.onAppear {
                    DispatchQueue.main.async {
                        viewModel.fetchWeather(for: Date(), coordinates: coordinates)
                    }
                }
            }
        }
}
