//
//  SearchView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 5.5.2024.
//

import SwiftUI

/**
 A view for searching cities and displaying search results.

 Use this view to search for cities and display search results. It includes a search bar, search results list, and loading indicator.
 */
struct SearchView: View {
    /// The view model for search functionality.
    @ObservedObject var searchViewModel: SearchViewModel
    /// The view model for weather data.
    @ObservedObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
           NavigationStack {
               VStack {
                   Text("Search").font(.title)
                   HStack {
                       Spacer()
                       Image(systemName: "magnifyingglass").font(.system(size: 18))
                       TextField("Search for a city...", text: $searchViewModel.currentValue)
                           .onChange(of: searchViewModel.debouncedValue) { newValue in
                               searchViewModel.fetchSearchResults(for: newValue)
                           }
                           .textFieldStyle(OvalTextFieldStyle())
                           .padding()
                   }.padding(.horizontal, 10)
                   Divider()
                   
                   if searchViewModel.loading {
                           ProgressView()
                               .padding()
                       } else {
                           // Check for search results
                           if let searchData = searchViewModel.searchData?.results, !searchData.isEmpty {
                               List(searchData, id: \.id) { city in
                                   NavigationLink(destination: CityDetailView(city: city, viewModel: weatherViewModel)) {
                                       Text("\(city.name), \(city.country)")
                                   }
                                   .padding()
                                   .listRowBackground(Color.clear)
                               }
                               .listStyle(PlainListStyle())
                           } else {
                               // Display "No results found" message if there are no search results
                               Text(searchViewModel.debouncedValue.isEmpty ? "" : "No results found")
                                   .padding()
                           }
                       }
                   Spacer()
               }
               .scrollContentBackground(.hidden)
               .background(Color.blue.opacity(0.2))
               .navigationBarHidden(true)
               .edgesIgnoringSafeArea(.top)
           }.onAppear {
               UITextField.appearance().clearButtonMode = .whileEditing
           }
    }
}

/// The view model for weather data.
struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.secondary, lineWidth: 1)
            )
    }
}
