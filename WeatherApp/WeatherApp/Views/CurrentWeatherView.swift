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
        VStack(alignment: .leading, spacing: 10) {
            Text(item.title).font(.system(size: 20)).bold()
            HStack {
                Text(item.temp).font(.system(size: 56)).fontWeight(.light).padding(.trailing, 5)
                Image(systemName: item.icon).font(.system(size: 40)).foregroundStyle(.yellow)
                Spacer()
            }
        }.padding()
    }
}
