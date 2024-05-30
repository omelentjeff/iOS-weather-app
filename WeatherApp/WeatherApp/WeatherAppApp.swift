//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

/**
 The main entry point of the WeatherApp application.

 This struct conforms to the `App` protocol, which represents the structure and behavior of an application.
 */
@main
struct WeatherAppApp: App {
    
    /// A property wrapper that reads and writes a value from UserDefaults for a specific key.
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    /**
    The body of the application.
    
    Describes the scene that represents the content and behavior of the app.
    
    - Returns: A scene that displays the content of the app.
    */
    var body: some Scene {
        WindowGroup {
            ContainerView().modifier(DarkModeViewModifier())
        }
    }
}
