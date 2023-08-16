//  Brno - 49.19522264287748, 16.605414965101804

import SwiftUI
import MapKit

struct PlacesMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
           mapViewWithAnnotations
        }
    }
}

// MARK: EXTENSION
extension PlacesMapView {
    private var mapViewWithAnnotations: some View {
        Map(coordinateRegion: model.$region, annotationItems: model.places, annotationContent: {
            place in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(place.geometry?.latitude ?? 0.0) , longitude: CLLocationDegrees(place.geometry?.longitude ?? 0.0))) {
                PlaceMapAnnotationView(placeSymbol: "building.columns")
                    .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
                    .animation(.easeInOut)
                    .onTapGesture {
                        model.selectedPlace = place
                    }
            }
        })
        .ignoresSafeArea(edges: .top)
        .task {
            await model.fetchData()
        }
        .sheet(item: model.$selectedPlace) { place in
            coordinator.placeDetailScene(with: place)
        }
    }
}

// MARK: PREVIEW
struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
