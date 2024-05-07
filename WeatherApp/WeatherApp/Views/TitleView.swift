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
            Image(systemName: "sun.horizon.fill").font(.system(size: 20)).padding(.trailing, 5).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("Weather App").font(.system(size: 20))
            Spacer()
        }.padding(.bottom, 10).padding(.leading, 10).background(.blue.opacity(0.2))
    }
}
