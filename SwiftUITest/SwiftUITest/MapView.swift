//
//  MapView.swift
//  SwiftUITest
//
//  Created by JL L on 2025/05/18.
//

import SwiftUI
import MapKit
struct MapView: View {
    struct PinItem : Identifiable {
        let id = UUID()
        let coordinate :CLLocationCoordinate2D
    }
    @State var region = MKCoordinateRegion(center: .init(latitude: 37.334722, longitude: -122.008889), latitudinalMeters: 300, longitudinalMeters: 300)
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: [],
            showsUserLocation : true,
            userTrackingMode: nil,
            annotationItems: [PinItem(coordinate: .init(latitude: 37.334722, longitude: -122.008889))]) { item in
            MapMarker(coordinate: item.coordinate)
        }
        
        
        
    }
}

#Preview {
    MapView()
}
