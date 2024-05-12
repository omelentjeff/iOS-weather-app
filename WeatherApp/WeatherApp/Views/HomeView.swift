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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1...4, id: \.self) { _ in
                        WeatherContainer(coordinates: viewModel.coordinates).containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                    }
                }.onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }.padding(.bottom, 10)
            }
        }
    }
}

