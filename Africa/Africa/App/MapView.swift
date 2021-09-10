//
//  MapView.swift
//  Africa
//
//  Created by Andoni Da silva on 26/5/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: PROPERTIES

    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.437759)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        let mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: BODY

    var body: some View {
        // MARK: N0 1 BASIC MAP
        // Map(coordinateRegion: $region)

        // MARK: N0 2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) OLD PIN
            //MapPin(coordinate: item.location, tint: .accentColor)

            // (B) MARKER
            //MapMarker(coordinate: item.location, tint: .accentColor)

            // (C) CUSTOM BASIC ANNOTATION
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
