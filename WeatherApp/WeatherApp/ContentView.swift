//
//  ContentView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            //TitleView()
            Spacer()
            TabView {
                HomeView(coordinates: viewModel.coordinates)
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun")
                    }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                MapView(coordinates: viewModel.coordinates)
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        }.onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
        }
    }
}
