//
//  LocationModel.swift
//  Africa
//
//  Created by Andoni Da silva on 9/9/21.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id, name, image: String
    let latitude, longitude: Double

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
