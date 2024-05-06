//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var toggleOn: Bool = false
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Text("Settings").padding(.top, 20).font(.system(size: 24)).bold()
            Spacer()
            
            HStack {
                Text("Choose theme")
                ZStack {
                    Capsule()
                        .frame(width:80,height:44)
                        .foregroundStyle(toggleOn ? .white : Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6039008336)))
                    ZStack{
                        Circle()
                            .frame(width:40, height:40)
                            .foregroundStyle(toggleOn ? .black : .white)
                        Image(systemName: toggleOn ? "moon.fill" : "sun.min")
                    }

                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x:toggleOn ? 18 : -18)
                    .padding(24)
                    //.animation(.spring(), value: toggleOn)
                }
                .onTapGesture {
                    self.toggleOn.toggle()
                    isDarkMode.toggle()
                }
            }
            Spacer()
        }
    }
}
