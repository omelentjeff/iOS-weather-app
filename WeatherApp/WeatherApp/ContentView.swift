//
//  ContentView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct ContentView: View {
    init() {
        //UITabBar.appearance().backgroundColor = UIColor.systemPink
    }
    
    var body: some View {
        VStack {
            TitleView()
            Spacer()
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "sun.max.fill")
                    }
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
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
