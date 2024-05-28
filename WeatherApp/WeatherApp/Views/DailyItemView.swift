//
//  DailyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 11.5.2024.
//

import SwiftUI

struct DailyItemView: View {
    let weekday: String
    let maxTemperature: Double
    let minTemperature: Double
    let isSelected: Bool
    let buttonAction: () -> Void
    @State private var rotationAngle = Angle(degrees: 0)
    
    var body: some View {
        HStack {
            Text(weekday).font(.system(size: 18))
            Image(systemName: "sun.max.fill").foregroundStyle(Color.yellow).font(.system(size: 20))
            Spacer()
            VStack(spacing: 5) {
                HStack(spacing: 10) {
                    Text(String(format: "H: %.0f°", maxTemperature))
                        .font(.system(size: 16))
                    Text(String(format: "L: %.0f°", minTemperature))
                        .font(.system(size: 16))
                }
                if isSelected {
                    HStack(spacing: 10) {
                    Text(String(format: "H: %.0f°", maxTemperature))
                        .font(.system(size: 16))
                    Text(String(format: "L: %.0f°", minTemperature))
                        .font(.system(size: 16))
                    }
                }
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
