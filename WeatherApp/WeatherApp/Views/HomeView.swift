//
//  HomeView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 6.5.2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
            ZStack {
                Rectangle().foregroundStyle(.blue.opacity(0.2))
                    TabView {
                        ForEach(MockData.items.indices) { index in
                            //let item = MockData.items[index]
                            if let weatherData = viewModel.weatherData {
                                WeatherContainer(viewModel: viewModel)

                                    .tabItem {
                                        if index == 0 {
                                            Image(systemName: "location")
                                        }
                                    }
                            } else {
                                Text("Loading...")
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
