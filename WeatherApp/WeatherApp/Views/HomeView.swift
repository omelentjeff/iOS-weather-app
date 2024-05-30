//
//  HomeView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 6.5.2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var coordinates: CLLocationCoordinate2D
    var title: String
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
