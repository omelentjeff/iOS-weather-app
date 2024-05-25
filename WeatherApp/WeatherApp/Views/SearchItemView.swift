//
//  SearchitemView.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 25.5.2024.
//

import SwiftUI

struct SearchItemView: View {
    var item: SearchResult
    
    var body: some View {
        HStack {
            Text(item.name)
        }
    }
}
