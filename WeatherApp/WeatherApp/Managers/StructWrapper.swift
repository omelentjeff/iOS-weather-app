//
//  StructWrapper.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 30.5.2024.
//

import Foundation

/**
 A wrapper class for encapsulating a struct instance.

 This class is used to wrap a struct instance and enable it to conform to Objective-C protocols that require reference semantics.
 */
class StructWrapper<T>: NSObject {
    /// The wrapped struct instance.
    let value: T

    /**
     Initializes a new instance of `StructWrapper` with the provided struct instance.

     - Parameter _struct: The struct instance to be wrapped.
     */
    init(_ _struct: T) {
        self.value = _struct
    }
}
