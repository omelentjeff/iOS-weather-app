//
//  SearchitemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI

/**
 A view representing a single search item in the search results list.
 */
struct SearchItemView: View {
    /// The city represented by the search item.
    var city: SearchResult
    
    var body: some View {
        HStack {
            Text(city.name)
        }
    }
}
