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
}
