//
//  CLLocation+Extension.swift
//  HowsTheWear
//
//  Created by RAFA on 2/19/24.
//

import MapKit

extension CLLocation {
    
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
    
}
