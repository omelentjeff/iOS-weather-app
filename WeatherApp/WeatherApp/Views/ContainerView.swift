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
                    ContentView(weatherViewModel: weatherViewModel, locationViewModel: viewModel)
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
                        weatherViewModel.fetchWeather(for: Date(), coordinates: newCoordinates)
                    }
                }
            }
        }
    }
}
