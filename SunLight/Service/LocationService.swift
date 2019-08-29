//
//  LocationService.swift
//  SunLight
//
//  Created by Pratik Bhaliya on 29/8/19.
//  Copyright © 2019 Pratik Bhaliya. All rights reserved.
//

import UIKit
import CoreLocation

class LocationService: NSObject {

    let locationManager: CLLocationManager?
    
    init(with locationManager:CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager?.delegate = self
    }
}

extension LocationService: CLLocationManagerDelegate {
    
}
