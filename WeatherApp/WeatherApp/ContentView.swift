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
                  SearchView()
                      .tabItem {
                          Label("Search", systemImage: "magnifyingglass")
                      }
                  SettingsView()
                      .tabItem {
                          Label("Settings", systemImage: "gearshape")
                      }
            }
        }
    }
}
