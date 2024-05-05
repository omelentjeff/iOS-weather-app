//
//  TitleView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Image(systemName: "sun.horizon.fill").font(.system(size: 28)).padding(.trailing, 5).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("Weather App").font(.system(size: 24))
        }.padding()
    }
}
