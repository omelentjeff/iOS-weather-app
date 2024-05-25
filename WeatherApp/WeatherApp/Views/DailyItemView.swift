//
//  DailyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 11.5.2024.
//

import SwiftUI

struct DailyItemView: View {
    let maxTemperature: Double
    let minTemperature: Double
    let isSelected: Bool
    let buttonAction: () -> Void
    @State private var rotationAngle = Angle(degrees: 0)
    
    var body: some View {
        HStack {
            Text("La").font(.system(size: 20))
            Image(systemName: "sun.max.fill").foregroundStyle(Color.yellow).font(.system(size: 20))
            Spacer()
            HStack(spacing: 10) {
                Text(String(format: "H: %.1f°", maxTemperature))
                    .font(.system(size: 18))
                Text(String(format: "L: %.1f°", minTemperature))
                    .font(.system(size: 18))
            }
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.buttonAction()
                }
            }) {
                Image(systemName: "chevron.down").rotationEffect(isSelected ? .degrees(180) : .degrees(0))
            }.padding(.leading, 30)
        }//.padding()
    }
}
