//
//  DailyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 11.5.2024.
//

import SwiftUI

struct DailyItemView: View {
    var body: some View {
        HStack {
            Text("la").padding(.trailing, 20)
            Image(systemName: "sun.max.fill").foregroundStyle(Color.yellow).padding(.bottom, 5)
            Spacer()
            Text("9°")
        }.padding()
    }
}
