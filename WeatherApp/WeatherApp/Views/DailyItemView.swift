//
//  DailyItemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 11.5.2024.
//

import SwiftUI

struct DailyItemView: View {
    let isSelected: Bool
    let buttonAction: () -> Void
    @State private var rotationAngle = Angle(degrees: 180)
    
    var body: some View {
        HStack {
            Text("la")
            Image(systemName: "sun.max.fill").foregroundStyle(Color.yellow).padding(.bottom, 5)
            Spacer()
            Text("9°")
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.buttonAction()
                    rotationAngle += isSelected ? Angle(degrees: -180) : Angle(degrees: 180)
                }
            }) {
               Image(systemName: "chevron.up").rotationEffect(rotationAngle)
            }.padding(.leading, 30)
        }.padding()
    }
}
