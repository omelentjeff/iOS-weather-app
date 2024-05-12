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
        ZStack {
            Rectangle().foregroundStyle(.blue.opacity(0.2))
            ScrollView(showsIndicators: false) {
                VStack {
                    CurrentWeatherView(coordinates: viewModel.coordinates)
                    
                    //Spacer()
                    
                    HourlyWeatherView()
                    
                    // Spacer()
                    
                    SevenDayForecastView()
                }.onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }.padding(.bottom, 10)
            }
        }
    }
}

