import MapKit
import SwiftUI

struct PlacesViewModel: DynamicProperty {
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject

    @State var selectedPlace: Place?
    @State var selectedKind = "Vše"
    @State var region = MKCoordinateRegion( // Brno coordinates
        center: CLLocationCoordinate2D(
            latitude: 49.19522264287748,
            longitude: 16.605414965101804),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1))
    @State var searchQuery = ""

    var places: [Place] {
        placesObservableObject.places
    }

    var favPlaces: [Int] {
        placesObservableObject.favouritePlaces ?? []
    }

    func showFavoritePlaces() -> [Place] {
        places.filter { favPlaces.contains($0.attributes.ogcFid) }
    }

    func fetchPlacesData() async {
        await placesObservableObject.fetchPlacesData()
    }

    func filterPlaces(by kind: String) -> [Place] {
        if kind == "Vše" {
            return searchedPlaces()
        } else {
            return searchedPlaces().filter { $0.attributes.kind.rawValue == kind }
        }
    }

    func searchedPlaces() -> [Place] {
        if searchQuery.isEmpty {
            return places
        } else {
            let searchedPlaces = places.filter {
                $0.attributes.title.localizedCaseInsensitiveContains(searchQuery) ||
                $0.attributes.kind.rawValue.localizedCaseInsensitiveContains(searchQuery)
            }
            return searchedPlaces
        }
    }
}
