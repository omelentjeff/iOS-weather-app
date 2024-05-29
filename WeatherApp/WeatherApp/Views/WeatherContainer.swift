//
//  WeatherContainer.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 12.5.2024.
//

import SwiftUI
import CoreLocation

struct WeatherContainer: View {
    @ObservedObject var viewModel: WeatherViewModel
    var locationTitle: String
    //var coordinates: CLLocationCoordinate2D
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                if let weatherData = viewModel.weatherData {
                    CurrentWeatherView(viewModel: viewModel, locationTitle: locationTitle).padding(.bottom, 40)
                    //SevenDayForecastView(viewModel: viewModel)
                } else {
                    Text("Loading...")
                }
            }/*.onAppear {
                DispatchQueue.main.async {
                    viewModel.fetchWeather(for: Date(), coordinates: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude))
                }
            }*/
        }
    }
}
