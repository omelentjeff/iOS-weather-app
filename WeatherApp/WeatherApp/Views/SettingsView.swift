//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var darkMode = true
    var body: some View {
        VStack {
            Text("Settings").padding(.top, 20).font(.system(size: 24)).bold()
            Toggle("Dark Mode", isOn: $darkMode).padding(60)
            Spacer()
        }
    }
}
