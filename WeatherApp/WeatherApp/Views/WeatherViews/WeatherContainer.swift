//
//  WeatherContainer.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 12.5.2024.
//

import SwiftUI
import CoreLocation

/**
 A container view for displaying weather information.

 Use this view to present current weather conditions for a specific location.
 */
struct WeatherContainer: View {
    /// The view model containing weather data.
    @ObservedObject var viewModel: WeatherViewModel
    /// The title of the location.
    var locationTitle: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                if let weatherData = viewModel.weatherData {
                    CurrentWeatherView(viewModel: viewModel, locationTitle: locationTitle).padding(.bottom, 40)
                    //SevenDayForecastView(viewModel: viewModel)
                } else {
                    Text("Loading...")
                }
            }
        }
    }
}
