//
//  CityDetailView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI
import CoreLocation

struct CityDetailView: View {
    var city: SearchResult
    @ObservedObject var viewModel: WeatherViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                VStack {
                    HomeView(viewModel: viewModel, coordinates: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude), title: city.name)
                }
                .onAppear {
                    DispatchQueue.main.async {
                        viewModel.fetchWeather(for: Date(), coordinates: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude))
                    }
                }
                .navigationTitle("")
                .toolbar(.hidden, for: .navigationBar)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left").font(.system(size: 18))
                        Text("Search").font(.system(size: 18))
                    }
                    .tint(Color.white)
                }
                .padding()
                .position(x: geometry.safeAreaInsets.leading + 50, y: geometry.safeAreaInsets.top + 10) 
            }
            //.background(Color.blue.opacity(0.2))
        }
    }
}
