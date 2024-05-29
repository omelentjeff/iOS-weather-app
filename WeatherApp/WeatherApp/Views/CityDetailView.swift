//
//  CityDetailView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI
import CoreLocation

struct CityDetailView: View {
    var city: SearchResult
    @ObservedObject var viewModel: WeatherViewModel
    
    
    var body: some View {
        HStack {
            HomeView(viewModel: viewModel, coordinates: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude), title: city.name)
        }.onAppear {
            DispatchQueue.main.async {
                viewModel.fetchWeather(for: Date(), coordinates: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude))
            }
        }.navigationBarHidden(true)
    }
}
