//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 9.5.2024.
//

import CoreLocation
import SwiftUI

/**
 A view model responsible for managing location-related operations and permissions.

 Use this view model to check if location services are enabled, handle location authorization status, and retrieve the user's current coordinates.
 */
final class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    /// The CLLocationManager instance used for managing location-related operations.
    var locationManager: CLLocationManager?
    /// The current coordinates of the user's location.
    @Published var coordinates = CLLocationCoordinate2D()
    /// A boolean indicating whether to show an alert.
    @Published var showAlert = false
    /// The title of the alert.
    @Published var alertTitle = ""
    /// The message of the alert.
    @Published var alertMessage = ""
    
    /**
     Checks if location services are enabled on the user's device.
     */
    func checkIfLocationServicesIsEnabled() {
        // Have to call this outside the main thread to avoid potential UI unresponsiveness
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                DispatchQueue.main.async {
                    self.locationManager = CLLocationManager()
                    self.locationManager!.delegate = self
                    //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
                }
            } else {
                print("Location not allowed")
            }
        }
    }
    
    /**
     Checks the authorization status of the location manager and handles different scenarios.
     */
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            showAlert(title: "Restricted Location", message: "Your location is restricted, likely due to parental controls")
        case .denied:
            showAlert(title: "Denied Location", message: "You have denied this app location permission, go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            if let location = locationManager.location {
                coordinates = location.coordinate
            }
        @unknown default:
            break
        }
    }
    
    /**
     Shows an alert with the specified title and message.
     
     - Parameters:
        - title: The title of the alert.
        - message: The message of the alert.
     */
    private func showAlert(title: String, message: String) {
        self.alertTitle = title
        self.alertMessage = message
        self.showAlert = true
    }
    
    /**
     Handles changes in the location manager's authorization status.
     
     - Parameters:
        - manager: The CLLocationManager instance.
     */
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

