import MapKit
import SwiftUI

struct PlacesViewModel: DynamicProperty {
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject

    @State var selectedPlace: Place?
    @State var placeKind = "Vše"
    @State var searchText = ""
    @State var region = MKCoordinateRegion( // Brno coordinates
        center: CLLocationCoordinate2D(
            latitude: 49.19522264287748,
            longitude: 16.605414965101804),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1))

    var places: [Place] {
        placesObservableObject.places
    }

    var favPlaces: [Int] {
        placesObservableObject.favouritePlaces ?? []
    }

    func showFavoritePlaces() -> [Place] {
        places.filter { favPlaces.contains($0.attributes.ogcFid) }
    }

    var placesAreFetched: Bool {
        !places.isEmpty
    }

    func fetchData() async {
        await placesObservableObject.fetchPlacesData()
    }

    func placesFilter(with kind: String) -> [Place] {
        if kind == "Vše" {
            return placesObservableObject.places
        } else {
            return placesObservableObject.places.filter { $0.attributes.kind.rawValue == kind }
        }
    }
}
