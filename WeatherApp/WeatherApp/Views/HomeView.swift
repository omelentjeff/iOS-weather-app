//
//  HomeView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 6.5.2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            CurrentWeatherView(coordinates: viewModel.coordinates)
            
            Spacer()
            
            //SevenDayForecastView()
        }.onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
        }
    }
}

