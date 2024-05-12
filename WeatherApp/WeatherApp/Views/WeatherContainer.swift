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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                CurrentWeatherView(coordinates: coordinates)
                HourlyWeatherView().padding(.bottom, 20)
                SevenDayForecastView()
            }
        }
    }
}
