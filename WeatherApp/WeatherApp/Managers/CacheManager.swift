//
//  CacheManager.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import CoreLocation
import SwiftUI

final class CacheManager {
    
    static let instance = CacheManager() // Singleton
    
    private init() { }
    
    var weatherCache: NSCache<NSString, StructWrapper<WeatherData>> = {
        let cache = NSCache<NSString, StructWrapper<WeatherData>>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(data: StructWrapper<WeatherData>, latitude: Double, longitude: Double) {
        let key = "\(latitude)_\(longitude)" as NSString
        weatherCache.setObject(data, forKey: key)
        print("Added to cache")
    }
    
    func remove(latitude: Double, longitude: Double) {
        let key = "\(latitude)_\(longitude)" as NSString
        weatherCache.removeObject(forKey: key)
        print("Removed from cache")
    }
    
    func get(latitude: Double, longitude: Double) -> StructWrapper<WeatherData>? {
        let key = "\(latitude)_\(longitude)" as NSString
        return weatherCache.object(forKey: key)
    }
}
