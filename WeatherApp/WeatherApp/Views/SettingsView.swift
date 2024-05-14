import SwiftUI

struct SettingsView: View {
    @State private var toggleOn: Bool = false
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
