//
//  ContainerView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI
import CoreLocation

struct ContainerView: View {
    @StateObject private var viewModel = LocationViewModel()
    @State private var isSplashScreenViewPresented = true
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            if !isSplashScreenViewPresented {
                ZStack {
                    Rectangle().foregroundStyle(.blue.opacity(0.2)).ignoresSafeArea()
                    ContentView(weatherViewModel: weatherViewModel)
                }
            } else {
                SplashScreenView(isPresented: $isSplashScreenViewPresented)
                    .onAppear {
                        // Fetch weather data in the background
                        DispatchQueue.global().async {
                            weatherViewModel.fetchWeather(for: Date(), coordinates: CLLocationCoordinate2D(latitude: 23, longitude: 62))
                        }
                    }
            }
        }
    }
}
