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
            TitleView()
            Spacer()
            TabView {
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }.onAppear() {
                UITabBar.appearance().backgroundColor = UIColor(.gray).withAlphaComponent(0.3)
            }.tint(.blue)
            
        }
    }
}
