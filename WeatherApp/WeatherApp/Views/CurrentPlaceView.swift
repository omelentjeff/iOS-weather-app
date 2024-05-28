//
//  CurrentPlaceView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 27.5.2024.
//

import SwiftUI
import CoreLocation

struct CurrentPlaceView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var coordinates: CLLocationCoordinate2D
    
    
    var body: some View {
        HStack {
            WeatherContainer(viewModel: viewModel, locationTitle: "Placeholder"/* coordinates: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude)*/)
        }/*.onAppear {
            DispatchQueue.main.async {
                viewModel.fetchWeather(for: Date(), coordinates: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude))
            }
            print("CurrentPlaceView \(coordinates)")
        }*/
    }
}

