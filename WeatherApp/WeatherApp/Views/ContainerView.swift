//
//  ContainerView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = true
    
    var body: some View {
        if !isSplashScreenViewPresented {
            ContentView()
        } else {
            SplashScreenView(isPresented: $isSplashScreenViewPresented)
        }
    }
}
