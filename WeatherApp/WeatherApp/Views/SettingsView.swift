//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isSettingsActive: Bool
    var body: some View {
        VStack {
            Text("Settings").padding(.top, 20).font(.system(size: 24)).bold()
            HStack {
                Button(action: { isSettingsActive = false}) {
                    Text("Close")
                        .padding()
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }.padding(.top, 20)
            Spacer()
        }
    }
}
