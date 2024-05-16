//
//  HomeView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 6.5.2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    //@StateObject private var viewModel = LocationViewModel()
    var coordinates: CLLocationCoordinate2D
    
    var body: some View {
        ZStack {
            Rectangle().foregroundStyle(.blue.opacity(0.2))
                TabView {
                    ForEach(MockData.items.indices) { index in
                        let item = MockData.items[index]
                        WeatherContainer(coordinates: coordinates, item: item)
                            // Set custom icon for the first page
                            .tabItem {
                                if index == 0 {
                                    Image(systemName: "location")
                                }
                            }
                    }
                }.tabViewStyle(.page(indexDisplayMode: .always))
            }
        }
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let temp: String
    let icon: String
}

struct MockData {
    static var items = [Item(title: "Pirkkala", temp: "19°", icon: "sun.max.fill"),
                        Item(title: "Tampere", temp: "10°", icon: "cloud.fill"),
                        Item(title: "Ylöjärvi", temp: "8°", icon: "cloud.drizzle"),
                        Item(title: "New York", temp: "4°", icon: "cloud.moon")]
}
