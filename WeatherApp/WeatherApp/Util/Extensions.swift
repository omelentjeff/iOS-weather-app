//
//  Extensions.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 28.5.2024.
//

import Foundation
import CoreLocation

/**
 An extension for `Date` providing a method to convert it to a string with a given format.
 */
extension Date {
    /**
     Converts the date to a string with the specified format.

     - Parameter format: The format string to use for the conversion.
     - Returns: A string representation of the date based on the specified format.
     */
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

/**
 An extension for `CLLocationCoordinate2D` providing Equatable conformance.
 */
extension CLLocationCoordinate2D: Equatable {
    /**
     Checks if two `CLLocationCoordinate2D` instances are equal.

     - Parameters:
        - lhs: The left-hand side `CLLocationCoordinate2D` to compare.
        - rhs: The right-hand side `CLLocationCoordinate2D` to compare.
     - Returns: `true` if the two instances are equal, otherwise `false`.
     */
    public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
