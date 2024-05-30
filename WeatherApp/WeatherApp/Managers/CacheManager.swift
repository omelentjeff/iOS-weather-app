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
    
    var weatherCache: NSCache<NSNumber, StructWrapper<WeatherData>> = {
        let cache = NSCache<NSNumber, StructWrapper<WeatherData>>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(data: StructWrapper<WeatherData>, id: Int) {
        weatherCache.setObject(data, forKey: id as NSNumber)
        print("Added to cache")
    }
    
    func remove(id: Int) {
        weatherCache.removeObject(forKey: id as NSNumber)
        print("Removed from cache")
    }
    
    func get(id: Int) -> StructWrapper<WeatherData>? {
        return weatherCache.object(forKey: id as NSNumber)
    }
}
