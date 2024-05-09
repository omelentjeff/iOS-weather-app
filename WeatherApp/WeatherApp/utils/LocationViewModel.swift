//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Otto Melentjeff on 9.5.2024.
//

import CoreLocation

final class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var coordinates = CLLocationCoordinate2D()
    
    // Check if user's phone has location services enabled
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
    
    // Check all cases for location manager's authorization status
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted, likely due to parental controls")
        case .denied:
            print("You have denied this app location permission, go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            if let location = locationManager.location {
                coordinates = location.coordinate
            }
        @unknown default:
            break
        }
    }
    
    // Checks if location authorization has changed
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
