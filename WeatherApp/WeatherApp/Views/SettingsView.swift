import SwiftUI

struct SettingsView: View {
    @State private var toggleOn: Bool = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Text("Settings").padding(.top, 20).font(.system(size: 24)).bold()
            Spacer()
            
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
