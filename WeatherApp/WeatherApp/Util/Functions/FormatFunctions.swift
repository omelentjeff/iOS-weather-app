//
//  FormatFunctions.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 29.5.2024.
//

import Foundation

func getHoursFormatted(stringArray: [String]) -> [String] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'H:mm"
        
    return stringArray.map { $0.components(separatedBy: "T")[1].replacingOccurrences(of: ":", with: ".")}
}
