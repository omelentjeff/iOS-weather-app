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
    
    /*
    init() {
        // Set the navigation bar appearance to be hidden, but keep the back button visible
        let appearance = UINavigationBar.appearance()
        appearance.setBackgroundImage(UIImage(), for: .default)
        appearance.shadowImage = UIImage()
        appearance.isTranslucent = true
    }*/
    
    /*init() {
      UITextField.appearance().clearButtonMode = .whileEditing
    }*/
    
    var body: some View {
           NavigationStack {
               VStack {
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
                   
                   //Spacer()
                   
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
           }//.background(Color.blue.opacity(0.2))
           //.ignoresSafeArea()
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
