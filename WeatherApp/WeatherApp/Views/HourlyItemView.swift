//
//  HourlyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyItemView: View {
    var isEmbedded: Bool = false
    
    var body: some View {
        VStack {
            Text("13").font(.system(size: isEmbedded ? 16 : 18)).padding(.bottom, 5)
            Image(systemName: "sun.max.fill").font(.system(size: isEmbedded ? 16 : 20)).foregroundStyle(Color.yellow).padding(.bottom, 5)
            Text("9°").font(.system(size: isEmbedded ? 16 : 18)).bold()
        }
    }
}
