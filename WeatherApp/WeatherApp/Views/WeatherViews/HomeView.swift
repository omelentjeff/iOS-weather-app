//
//  HomeView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 6.5.2024.
//

import SwiftUI
import CoreLocation

/**
 A view representing the home screen of the WeatherApp.

 Use this view to display weather information and forecasts for a specific location.
 */
struct HomeView: View {
    /// The view model containing weather data.
    @ObservedObject var viewModel: WeatherViewModel
    /// The coordinates of the location.
    var coordinates: CLLocationCoordinate2D
    /// The title of the location.
    var title: String
    /// The index of the selected tab.
    @State private var selectedTabIndex = 0
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.blue.opacity(0.2))
            
            VStack {
                if viewModel.loading {
                    ProgressView()
                } else {
                    // Custom Tab Indicator
                    HStack(spacing: 16) {
                        ForEach(0..<2) { index in
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(index == selectedTabIndex ? .white : .gray)
                                .frame(width: 8, height: 4)
                        }
                    }
                    .padding(.top, 8)
                    
                    // TabView
                    TabView(selection: $selectedTabIndex) {
                        WeatherContainer(viewModel: viewModel, locationTitle: title)
                            .tag(0)
                        
                        SevenDayForecastView(viewModel: viewModel)
                            .tag(1)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
        }
    }
}
