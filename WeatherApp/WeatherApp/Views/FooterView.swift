//
//  FooterView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct FooterView: View {
    @State var isSearchActive: Bool = false
    
    var body: some View {
        HStack {
            MyButton(image: "star", color: Color.white, label: "Favorites", textColor: Color.white, action: {})
            Spacer()
            MyButton(image: "magnifyingglass", color: Color.white, label: "Search", textColor: Color.white, action: {isSearchActive = true}).sheet(isPresented: $isSearchActive, content: {
                SearchView(isSearchActive: $isSearchActive)
            })
            Spacer()
            MyButton(image: "gearshape", color: Color.white, label: "Settings", textColor: Color.white, action: {})
        }.background(.blue)
    }
}

