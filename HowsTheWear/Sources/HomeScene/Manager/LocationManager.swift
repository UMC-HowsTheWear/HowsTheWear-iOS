//
//  LocationManager.swift
//  HowsTheWear
//
//  Created by RAFA on 2/9/24.
//

import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()

    static let shared = LocationManager()

    private var locationFetchCompletion: ((CLLocation) -> Void)?

    var location: CLLocation? {
        didSet {
            guard let location else {
                return
            }
            locationFetchCompletion?(location)
        }
    }

    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {

        self.locationFetchCompletion = completion

        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }

    // MARK: - Location

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.location = location
        manager.stopUpdatingLocation()
    }
    
}