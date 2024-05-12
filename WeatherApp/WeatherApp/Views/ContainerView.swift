//
//  ContainerView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 8.5.2024.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashScreenViewPresented = false
    
    var body: some View {
        if !isSplashScreenViewPresented {
            ZStack {
                Rectangle().foregroundStyle(.blue.opacity(0.2)).ignoresSafeArea()
                ContentView()
            }
        } else {
            SplashScreenView(isPresented: $isSplashScreenViewPresented)
        }
    }
}
