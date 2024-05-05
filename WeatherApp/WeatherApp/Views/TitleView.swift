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
            Image(systemName: "sun.horizon.fill").font(.system(size: 24))
            Text("Weather App").font(.system(size: 20))
        }.padding()
    }
}
