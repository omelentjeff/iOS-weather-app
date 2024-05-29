//
//  SearchView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    /*init() {
      UITextField.appearance().clearButtonMode = .whileEditing
    }*/
    
    var body: some View {
           NavigationStack {
               VStack {
                   HStack {
                       Spacer()
                       Image(systemName: "magnifyingglass")
                       TextField("Search for a city...", text: $searchViewModel.currentValue)
                           .onChange(of: searchViewModel.debouncedValue) { newValue in
                               searchViewModel.fetchSearchResults(for: newValue)
                           }
                           .textFieldStyle(OvalTextFieldStyle())
                           .padding()
                   }
                   
                   Spacer()
                   
                   if let searchData = searchViewModel.searchData?.results, !searchData.isEmpty {
                       List(searchData, id: \.id) { city in
                           NavigationLink(destination: CityDetailView(city: city, viewModel: weatherViewModel)/*toolbar(
                            .hidden, for: .navigationBar)*/) {
                               Text("\(city.name), \(city.country)")
                           }
                       }
                   } else {
                       Text(searchViewModel.debouncedValue.isEmpty ? "" : "No results found")
                           .padding()
                   }
                   Spacer()
               }
               .background(Color.blue.opacity(0.2))
               .navigationTitle("Search")
               .navigationBarBackButtonHidden(false)
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
