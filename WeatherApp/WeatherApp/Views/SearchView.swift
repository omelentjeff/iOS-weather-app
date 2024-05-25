//
//  SearchView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    /*init() {
      UITextField.appearance().clearButtonMode = .whileEditing
    }*/
    
    var body: some View {
           NavigationStack {
               VStack {
                   HStack {
                       Spacer()
                       Image(systemName: "magnifyingglass")
                       TextField("Search for a city...", text: $viewModel.currentValue)
                           .onChange(of: viewModel.debouncedValue) { newValue in
                               viewModel.fetchSearchResults(for: newValue)
                           }
                           .textFieldStyle(OvalTextFieldStyle())
                           .padding()
                   }
                   
                   Spacer()
                   
                   if let searchData = viewModel.searchData?.results, !searchData.isEmpty {
                       List(searchData, id: \.id) { city in
                           NavigationLink(destination: CityDetailView()) {
                               Text(city.name)
                           }
                       }
                   } else {
                       Text(viewModel.debouncedValue.isEmpty ? "" : "No results found")
                           .padding()
                   }
                   Spacer()
               }
               .navigationTitle("Search")
           }
       }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            //.background(.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 1)
            )
            //.cornerRadius(20)
            //.shadow(color: .gray, radius: 10)
    }
}
