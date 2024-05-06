//
//  SearchView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SearchView: View {
    init() {
      UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    @State private var searchText = ""
    @State private var submittedText = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for a city...", text: $searchText).onSubmit {
                    submitSearch()
                }.textFieldStyle(OvalTextFieldStyle())
            }.padding()
            
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

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
