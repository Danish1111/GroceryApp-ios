//
//  LocationManager.swift
//  General Grocery Store
//
//  Created by Absolute on 15/07/25.
//

import Foundation
import CoreLocation
import Combine

class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate{
    private let manager = CLLocationManager()
    @Published var city: String = "Fetching..."
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                if let cityName = placemark.locality, let state = placemark.administrativeArea {
                    DispatchQueue.main.async {
                        self.city = "\(cityName), \(state)"
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
        self.city = "Unavailable"
    }

}
