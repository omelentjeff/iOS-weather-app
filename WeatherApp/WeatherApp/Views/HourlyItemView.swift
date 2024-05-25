//
//  HourlyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyItemView: View {
    var index: Int
    var temperature: Double
    var isEmbedded: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text(index == 0 ? "Now" : "16")
            Image(systemName: "sun.min")
            Text(String(format: "%.1f°", temperature))
                .font(.system(size: isEmbedded ? 16 : 18)).bold()
        }
    }
}
