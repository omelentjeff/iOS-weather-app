//
//  CacheViewModel.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import SwiftUI

/**
A view model responsible for caching WeatherData objects.

Use this view model to interact with the cache manager for saving, removing, and retrieving WeatherData objects.
*/
final class CacheViewModel: ObservableObject {
    
    /// The singleton instance of the CacheManager responsible for caching WeatherData objects.
    let manager = CacheManager.instance
    
    /**
     Saves the provided WeatherData object to the cache.
     
     - Parameters:
        - data: The WeatherData object to be saved.
        - latitude: The latitude associated with the WeatherData object.
        - longitude: The longitude associated with the WeatherData object.
     */
    func saveToCache(data: WeatherData, latitude: Double, longitude: Double) {
       let wrappedData = StructWrapper(data)
       manager.add(data: wrappedData, latitude: latitude, longitude: longitude)
   }
   
    /**
     Removes the WeatherData object associated with the provided latitude and longitude from the cache.
     
     - Parameters:
        - latitude: The latitude associated with the WeatherData object to be removed.
        - longitude: The longitude associated with the WeatherData object to be removed.
     */
   func removeFromCache(latitude: Double, longitude: Double) {
       manager.remove(latitude: latitude, longitude: longitude)
   }
   
    /**
     Retrieves the WeatherData object associated with the provided latitude and longitude from the cache.
     
     - Parameters:
        - latitude: The latitude associated with the WeatherData object to be retrieved.
        - longitude: The longitude associated with the WeatherData object to be retrieved.
     
     - Returns: The retrieved WeatherData object, if found in the cache; otherwise, returns nil.
     */
   func getFromCache(latitude: Double, longitude: Double) -> WeatherData? {
       let wrappedData = manager.get(latitude: latitude, longitude: longitude)
       return wrappedData?.value
   }
}
