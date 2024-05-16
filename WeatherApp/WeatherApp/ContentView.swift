//
//  ContentView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //TitleView()
            Spacer()
            TabView {
                HomeView()
                    .tabItem {
                        Label("Weather", systemImage: "cloud.sun")
                    }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                MapView()
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
        }
    }
}
