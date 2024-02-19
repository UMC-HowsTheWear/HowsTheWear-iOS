//
//  LocationManager.swift
//  HowsTheWear
//
//  Created by RAFA on 2/9/24.
//

import CoreLocation

class LocationManager: NSObject {
    
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    
    var locationStatus: CLAuthorizationStatus?
    var onLocationChange: ((CLLocation?) -> Void)?
    var onAuthStatusChange: ((CLAuthorizationStatus?) -> Void)?
    
    private var lastLocation: CLLocation? {
        didSet {
            guard let lastLocation else {
                return
            }
            locationFetchCompletion?(lastLocation)
        }
    }

    private var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        self.locationFetchCompletion = completion

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    func startLocationManagerIfNeeded() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        print(#function, statusString)
        onAuthStatusChange?(status)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastLocation = location
        print(#function, location)
        onLocationChange?(location)
        locationManager.stopUpdatingLocation()
    }
    
}
