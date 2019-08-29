//
//  LocationService.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 29/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit
import CoreLocation

enum Result<T> {
    case success(T)
    case error(Error)
}

class LocationService: NSObject {

    // MARK: - Properties
    let locationManager: CLLocationManager?
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    // MARK: - Closure
    var coordinates: ((Result<CLLocation>) -> Void)?

    init(with locationManager:CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager?.delegate = self
    }
    
    func getLocation() {
        self.locationManager?.requestLocation()
    }
    
    func getLocationAuthorization() {
        self.locationManager?.requestWhenInUseAuthorization()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
            coordinates?(.success(location))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        coordinates?(.error(error))
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied,.notDetermined,.restricted:
            getLocationAuthorization()
        default:
            getLocation()
        }
    }
}
