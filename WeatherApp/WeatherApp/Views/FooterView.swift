//
//  FooterView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            MyButton(image: "star", color: Color.white, label: "favorites", action: {})
            Spacer()
            MyButton(image: "magnifyingglass", color: Color.white, label: "search", action: {})
            Spacer()
            MyButton(image: "gearshape", color: Color.white, label: "settings", action: {})
        }.background(.blue)
    }
}

struct MyButton: View {
    var image: String
    var color: Color
    var label: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action, label: {
                Image(systemName: image)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 1, trailing: 20))
                    .font(.system(size: 24))
                    .foregroundStyle(color)
                //.cornerRadius(20)
            })
            Text(label).foregroundColor(.white).font(.system(size: 12)).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}
