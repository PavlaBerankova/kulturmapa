import MapKit
import SwiftUI

struct PlacesMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var locationManager: LocationManager
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                mapViewWithPinOfKind(model.selectedKind)
                VStack {
                    CustomNavigationToolbarWithPlaceType(selectedKind: model.$selectedKind)
                    Spacer()
                }
            }
        }
        .task {
            await model.fetchData()
        }
        .sheet(item: model.$selectedPlace) { place in
            coordinator.placeDetailScene(with: place)
        }
    }
}

// MARK: - EXTENSION
extension PlacesMapView {
    private func mapViewWithPinOfKind(_ kind: String) -> some View {
        Map(coordinateRegion: model.$region,
            showsUserLocation: true,
            annotationItems: model.placesFilter(with: kind)) { place in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(place.geometry?.latitude ?? 0.0),
                        longitude: CLLocationDegrees(place.geometry?.longitude ?? 0.0))) {
                            PlaceKindSymbol(symbol: place.symbol)
                                .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        model.selectedPlace = place
                                    }
                                }
                }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - PREVIEW
struct PlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesMapView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
            .environmentObject(LocationManager())
    }
}
