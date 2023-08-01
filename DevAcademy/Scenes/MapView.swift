//
//  MapView.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 02.08.2023.

//  Brno - 49.19522264287748, 16.605414965101804

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
       var mapCoordinates = CLLocationCoordinate2D(latitude: 49.19522264287748, longitude: 16.605414965101804)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $region)
                    .ignoresSafeArea(edges: .top)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
