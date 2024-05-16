//
//  MapView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 16.5.2024.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinates: CLLocationCoordinate2D
    
    var position: MapCameraPosition {
            MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                )
            )
        }
    
    var body: some View {
        Map(initialPosition: position).ignoresSafeArea()
    }
}
