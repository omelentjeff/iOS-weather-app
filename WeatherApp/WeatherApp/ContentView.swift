//
//  ContentView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI
import CoreLocation

/**
 The main content view of the Weather App, containing tabs for weather display, search, and settings.
 */
struct ContentView: View {
    /// The view model responsible for managing weather data for the home screen.
    @ObservedObject var homeWeatherViewModel: WeatherViewModel
    /// The view model responsible for managing weather data for search results.
   @StateObject var searchWeatherViewModel = WeatherViewModel()
    /// The view model responsible for managing location services.
   @ObservedObject var locationViewModel: LocationViewModel
    /// The view model responsible for managing search functionality
   @StateObject var searchViewModel = SearchViewModel(initialValue: "")
    
    var body: some View {
        VStack {
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
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        }.onAppear {
            setupTabBarAppearance()
        }.alert(isPresented: $locationViewModel.showAlert) {
            Alert(title: Text(locationViewModel.alertTitle), message: Text(locationViewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    /**
     Sets up the appearance of the tab bar.
     */
    private func setupTabBarAppearance() {
            let appearance = UITabBarAppearance()
            UITabBar.appearance().scrollEdgeAppearance = type(of: appearance).init(idiom: .unspecified)
            UITabBar.appearance().backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        }
}
