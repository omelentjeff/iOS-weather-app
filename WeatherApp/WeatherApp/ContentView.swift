//
//  ContentView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
       @ObservedObject var homeWeatherViewModel: WeatherViewModel
       @StateObject var searchWeatherViewModel = WeatherViewModel()
       @ObservedObject var locationViewModel: LocationViewModel
       @StateObject var searchViewModel = SearchViewModel(initialValue: "")
    
    var body: some View {
        VStack {
            //TitleView()
            Spacer()
            TabView {
                HomeView(viewModel: homeWeatherViewModel, coordinates: CLLocationCoordinate2D(latitude: locationViewModel.coordinates.latitude, longitude: locationViewModel.coordinates.longitude), title: "Your Location")
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun")
                    }
                SearchView(searchViewModel: searchViewModel, weatherViewModel: searchWeatherViewModel)
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                /*MapView(coordinates: viewModel.coordinates)
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }*/
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        }/*.onAppear {
            locationViewModel.checkIfLocationServicesIsEnabled()
        }*/
    }
}
