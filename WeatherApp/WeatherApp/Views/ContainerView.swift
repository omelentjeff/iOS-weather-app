//
//  ContainerView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = true
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            if !isSplashScreenViewPresented {
                ZStack {
                    Rectangle().foregroundStyle(.blue.opacity(0.2)).ignoresSafeArea()
                    ContentView(weatherViewModel: viewModel)
                }
            } else {
                SplashScreenView(isPresented: $isSplashScreenViewPresented)
                    .onAppear {
                        // Fetch weather data in the background
                        DispatchQueue.global().async {
                            viewModel.fetchWeather()
                        }
                    }
            }
        }
    }
}
