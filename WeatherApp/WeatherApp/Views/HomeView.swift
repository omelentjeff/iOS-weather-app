//
//  HomeView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 6.5.2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some View {
        ZStack {
            Rectangle().foregroundStyle(.blue.opacity(0.2))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(MockData.items) { item in
                        WeatherContainer(coordinates: viewModel.coordinates, item: item).containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                    }
                }.onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }.padding(.bottom, 10).scrollTargetLayout()
            }.scrollTargetBehavior(.viewAligned)
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
