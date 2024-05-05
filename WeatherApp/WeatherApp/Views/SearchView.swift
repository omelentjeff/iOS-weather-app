//
//  SearchView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var isSearchActive: Bool
    @State private var searchText = ""
    
    var body: some View {
        VStack {
                TextField("Search", text: $searchText).padding(20).textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Button(action: {}) {
                    Text("Search").padding().font(.system(size: 20)).foregroundColor(.white).background(.blue).clipShape(RoundedRectangle(cornerRadius: 20))
                }
                Button(action: {isSearchActive = false}) {
                    Text("Close").padding().font(.system(size: 20)).foregroundColor(.white).background(.red).clipShape(RoundedRectangle(cornerRadius: 20))
                }
                /*MyButton(image: "xmark.circle", color: Color.red, label: "", textColor: Color.blue, action: {isSearchActive = false})*/
            }
            Spacer()
        }
    }
}
