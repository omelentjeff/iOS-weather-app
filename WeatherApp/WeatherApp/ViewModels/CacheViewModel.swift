//
//  CacheViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import SwiftUI

final class CacheViewModel: ObservableObject {
    
    let manager = CacheManager.instance
    
    func saveToCache(data: WeatherData, latitude: Double, longitude: Double) {
       let wrappedData = StructWrapper(data)
       manager.add(data: wrappedData, latitude: latitude, longitude: longitude)
   }
   
   func removeFromCache(latitude: Double, longitude: Double) {
       manager.remove(latitude: latitude, longitude: longitude)
   }
   
   func getFromCache(latitude: Double, longitude: Double) -> WeatherData? {
       let wrappedData = manager.get(latitude: latitude, longitude: longitude)
       return wrappedData?.value
   }
}
