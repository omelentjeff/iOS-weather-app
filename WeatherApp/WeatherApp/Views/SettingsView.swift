import SwiftUI

/**
 A view for managing application settings.

 Use this view to allow users to toggle between different application settings, such as dark mode.

 - Note: This view relies on the @AppStorage property wrapper for persisting the state of the dark mode setting.
 */
struct SettingsView: View {
    /// The state indicating whether the toggle is on or off.
    @State private var toggleOn: Bool = false
    /// The boolean value indicating whether dark mode is enabled.
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle().foregroundStyle(.blue.opacity(0.2))
            VStack {
                Text("Choose theme")
                
                HStack {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                }.padding()
                Spacer()
            }
        }
    }
}

