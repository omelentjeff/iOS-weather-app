//
//  DarkModeViewModifier.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 7.5.2024.
//

import SwiftUI

/**
 A view modifier to apply dark mode settings to a SwiftUI view.
 
 This view modifier allows you to toggle between dark mode and light mode for a SwiftUI view based on a boolean value stored in an `@AppStorage` property.
*/
public struct DarkModeViewModifier: ViewModifier {
    /// A boolean value indicating whether dark mode is enabled.
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    
    /**
    Modifies the content view to apply dark mode settings.

    Parameter content: The content view to be modified.
    Returns: A modified view with dark mode settings applied.
    */
    public func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
