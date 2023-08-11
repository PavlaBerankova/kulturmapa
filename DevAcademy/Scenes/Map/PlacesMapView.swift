//  Brno - 49.19522264287748, 16.605414965101804

import SwiftUI
import MapKit

struct PlacesMapView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    let model = PlacesViewModel()
    @State var selectedPlace: Place?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: model.$region, annotationItems: model.places, annotationContent: {
                    place in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(place.geometry.latitude) , longitude: CLLocationDegrees(place.geometry.longitude))) {
                        PlaceMapAnnotationView(placeSymbol: "building.columns")
                            .scaleEffect(selectedPlace == place ? 1 : 0.7)
                            .animation(.easeInOut)
                            .onTapGesture {
                                selectedPlace = place
                            }
                    }
                })
                .ignoresSafeArea(edges: .top)
            }
            .onAppear(perform: model.fetch)
            .sheet(item: $selectedPlace) { place in
                coordinator.placeDetailScene(with: place)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
            .injectPreviewEnvironment()
    }
}
