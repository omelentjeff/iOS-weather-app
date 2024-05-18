//
//  HourlyWeatherView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 10.5.2024.
//

import SwiftUI

struct HourlyWeatherView: View {
    var isEmbedded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if !isEmbedded {
                Text("24h").font(.system(size: 18))
            }
            if !isEmbedded {
                Divider()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 35) {
                    ForEach(1...20, id: \.self) { _ in
                        HourlyItemView(isEmbedded: isEmbedded)
                    }
                }
            }
        }.padding(isEmbedded ? 5 : 20)
    }
}
