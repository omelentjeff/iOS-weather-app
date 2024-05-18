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
    var item: Item
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                CurrentWeatherView(coordinates: coordinates, item: item).padding(.bottom, 40)
                HourlyWeatherView().padding(.bottom, 40)
                SevenDayForecastView()
            }
        }
    }
}
