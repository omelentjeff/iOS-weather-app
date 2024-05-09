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
    
    var body: some View {
        Text("Pirkkala").font(.system(size: 32)).foregroundStyle(.blue).padding()
        Text("Weather Now")
        VStack {
            Text("Your coordinates are: ")
            Text("Lat: \(coordinates.latitude), Lon: \(coordinates.longitude)")
        }.padding()
    }
}
