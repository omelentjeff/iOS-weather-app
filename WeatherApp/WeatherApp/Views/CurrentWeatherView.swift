//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    var coordinates: CLLocationCoordinate2D
    var item: Item
    
    var body: some View {
        VStack() {
            Text(item.title).font(.system(size: 32)).padding(10)
            HStack {
                Text(item.temp).font(.system(size: 64)).fontWeight(.light).padding(.trailing, 10)
                Image(systemName: item.icon).font(.system(size: 50)).foregroundStyle(.yellow)
            }
        }
    }
}
