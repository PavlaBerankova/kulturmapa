//
//  MapView.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 02.08.2023.

//  Brno - 49.19522264287748, 16.605414965101804

import SwiftUI
import MapKit

struct PlacesMapView: View {
    
    let model = PlacesMapViewModel()
    
    var body: some View {
        NavigationStack {
            
                Map(coordinateRegion: model.$region)
                    .ignoresSafeArea(edges: .top)
            
        }
    }
}

struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
    }
}
