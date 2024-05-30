//
//  ContainerView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI
import CoreLocation

/**
 A container view managing the splash screen and main content of the app.
 */
struct ContainerView: View {
    /// The view model responsible for managing location services.
    @StateObject private var viewModel = LocationViewModel()
    /// Indicates whether the splash screen view is currently presented.
    @State private var isSplashScreenViewPresented = true
    /// The view model responsible for fetching weather data for the home screen.
    @StateObject private var homeWeatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            if !isSplashScreenViewPresented {
                ZStack {
                    Rectangle().foregroundStyle(.blue.opacity(0.2)).ignoresSafeArea()
                    ContentView(homeWeatherViewModel: homeWeatherViewModel, locationViewModel: viewModel)
                }
            } else {
                SplashScreenView(isPresented: $isSplashScreenViewPresented)
                .onAppear {
                    // Start checking location services
                    viewModel.checkIfLocationServicesIsEnabled()
                }
                .onChange(of: viewModel.coordinates) { newCoordinates in
                    // Fetch weather data when coordinates are updated
                    if newCoordinates.latitude != 0.0 && newCoordinates.longitude != 0.0 {
                        homeWeatherViewModel.fetchWeather(for: Date(), coordinates: newCoordinates)
                    }
                }
            }
        }
    }
}
