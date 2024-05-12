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
            Image(systemName: "sun.horizon.fill").font(.system(size: 24)).padding(.leading, 5).foregroundColor(.blue)
            Text("Weather App").font(Font.custom("Chalkduster", size: 20))
            Spacer()
        }.padding(.bottom, 10).padding(.leading, 10)
    }
}
