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
            WeatherContainer(coordinates: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude), viewModel: viewModel)
        }
    }
}
