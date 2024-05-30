//
//  FormatFunctions.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 29.5.2024.
//

import Foundation

/**
 Formats an array of strings containing timestamps into an array of strings containing only the hour component.

 - Parameter stringArray: An array of strings representing timestamps.
 - Returns: An array of strings with only the hour component formatted as "HH.mm".
 */
func getHoursFormatted(stringArray: [String]) -> [String] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'H:mm"
        
    return stringArray.map { $0.components(separatedBy: "T")[1].replacingOccurrences(of: ":", with: ".")}
}
