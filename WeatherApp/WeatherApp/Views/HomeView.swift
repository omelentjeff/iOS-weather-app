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
    
    var body: some View {
            ZStack {
                Rectangle().foregroundStyle(.blue.opacity(0.2))
                    TabView {
                        WeatherContainer(viewModel: viewModel, locationTitle: "placeholder")
                        SevenDayForecastView(viewModel: viewModel)
                    }.tabViewStyle(.page(indexDisplayMode: .always))
            }
        }
}
