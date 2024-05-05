//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var isFavoritesActive: Bool
    
    var body: some View {
        VStack {
            Text("Favorites").padding(.top, 20).font(.system(size: 24)).bold()
            HStack {
                Button(action: { isFavoritesActive = false}) {
                    Text("Close")
                        .padding()
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }.padding(.top, 20)
            Spacer()
        }
    }
}
