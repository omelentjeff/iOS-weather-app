//
//  FooterView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct TabBar: View {
    @State var isSearchActive: Bool = false
    @State var isSettingsActive: Bool = false
    @State var isFavoritesActive: Bool = false

    
    var body: some View {
        HStack {
            MyButton(image: "star", color: Color.white, label: "Favorites", textColor: Color.white, action: {isFavoritesActive = true}).sheet(isPresented: $isFavoritesActive, content: {
                FavoritesView(isFavoritesActive: $isFavoritesActive)
            })
            Spacer()
            MyButton(image: "magnifyingglass", color: Color.white, label: "Search", textColor: Color.white, action: {isSearchActive = true}).sheet(isPresented: $isSearchActive, content: {
                SearchView(isSearchActive: $isSearchActive)
            })
            Spacer()
            MyButton(image: "gearshape", color: Color.white, label: "Settings", textColor: Color.white, action: {isSettingsActive = true}).sheet(isPresented: $isSettingsActive, content: {
                SettingsView(isSettingsActive: $isSettingsActive)
            })
        }.background(.blue)
    }
}

