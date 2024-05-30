//
//  CacheViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import SwiftUI

final class CacheViewModel: ObservableObject {
    @Published var cachedData: WeatherData?
    
    let manager = CacheManager.instance
    
    func saveToCache(data: WeatherData, id: Int) {
        let wrappedData = StructWrapper(data)
        manager.add(data: wrappedData, id: id)
    }
    
    func removeFromCache(id: Int) {
        manager.remove(id: id)
    }
    
    func getFromCache(id: Int) {
        let wrappedData = manager.get(id: id)
        cachedData = wrappedData?.value
    }
}
