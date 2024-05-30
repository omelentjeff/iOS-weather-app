//
//  StructWrapper.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import Foundation

class StructWrapper<T>: NSObject {
    let value: T

    init(_ _struct: T) {
        self.value = _struct
    }
}
