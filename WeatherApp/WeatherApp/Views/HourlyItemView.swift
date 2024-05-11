//
//  HourlyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyItemView: View {
    var body: some View {
        VStack {
            Text("13").padding(.bottom, 5)
            Image(systemName: "sun.max.fill").foregroundStyle(Color.yellow).padding(.bottom, 5)
            Text("9°")
        }
    }
}
