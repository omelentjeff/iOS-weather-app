//
//  CacheManager.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import CoreLocation
import SwiftUI

/**
 A manager responsible for caching weather data.

 This class provides methods for adding, removing, and retrieving weather data from the cache.
 */
final class CacheManager {
    
    /// The singleton instance of `CacheManager`.
    static let instance = CacheManager()
    
    /// Initializes a new instance of `CacheManager`. This initializer is private to enforce the singleton pattern.
    private init() { }
    
    /// The cache for storing weather data.
    var weatherCache: NSCache<NSString, StructWrapper<WeatherData>> = {
        let cache = NSCache<NSString, StructWrapper<WeatherData>>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    /**
     Adds weather data to the cache.
     
     - Parameters:
        - data: The weather data to be added.
        - latitude: The latitude of the location associated with the weather data.
        - longitude: The longitude of the location associated with the weather data.
     */
    func add(data: StructWrapper<WeatherData>, latitude: Double, longitude: Double) {
        let key = "\(latitude)_\(longitude)" as NSString
        weatherCache.setObject(data, forKey: key)
        print("Added to cache")
    }
    
    /**
     Removes weather data from the cache.
     
     - Parameters:
        - latitude: The latitude of the location associated with the weather data to be removed.
        - longitude: The longitude of the location associated with the weather data to be removed.
     */
    func remove(latitude: Double, longitude: Double) {
        let key = "\(latitude)_\(longitude)" as NSString
        weatherCache.removeObject(forKey: key)
        print("Removed from cache")
    }
    
    /**
     Retrieves weather data from the cache.
     
     - Parameters:
        - latitude: The latitude of the location associated with the weather data to be retrieved.
        - longitude: The longitude of the location associated with the weather data to be retrieved.
     
     - Returns: The weather data associated with the specified latitude and longitude, if it exists in the cache; otherwise, `nil`.
     */
    func get(latitude: Double, longitude: Double) -> StructWrapper<WeatherData>? {
        let key = "\(latitude)_\(longitude)" as NSString
        return weatherCache.object(forKey: key)
    }
}
