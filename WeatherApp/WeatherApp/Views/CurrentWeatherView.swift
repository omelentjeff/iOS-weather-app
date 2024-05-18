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
            HStack {
                Text(item.title).font(.system(size: 20)).bold()
                Spacer()
                Text(getFormattedDate()).font(.system(size: 14))
            }
            HStack {
                Text(item.temp).font(.system(size: 56)).fontWeight(.light).padding(.trailing, 5)
                Image(systemName: item.icon).font(.system(size: 40)).foregroundStyle(.yellow)
                Spacer()
            }
        }.padding()
    }
}

func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: Date())
    }
