//
//  SearchView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var submittedText = ""
    
    var body: some View {
        VStack {
            Text("Search").padding(.top, 20).font(.system(size: 24)).bold()
            TextField("Search a city...", text: $searchText, onCommit: {
                submitSearch()
            })
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Button(action: {
                    submitSearch()
                }) {
                    Text("Search")
                        .padding()
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            Spacer()
            Text(submittedText)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
        }
    }
    
    private func submitSearch() {
            submittedText = searchText
            searchText = ""
        }
}

