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
    @State private var rotationAngle = Angle(degrees: 0)
    
    var body: some View {
        HStack {
            Text("la")
            Image(systemName: "sun.max.fill").foregroundStyle(Color.yellow).padding(.bottom, 5)
            Spacer()
            Text("9°")
            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.buttonAction()
                }
            }) {
                Image(systemName: "chevron.down").rotationEffect(isSelected ? .degrees(-180) : .degrees(0))
            }.padding(.leading, 30)
        }.padding()
    }
}
