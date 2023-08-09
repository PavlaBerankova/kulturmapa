import SwiftUI

struct PlacesViewModel: DynamicProperty {
    
    @EnvironmentObject private var placesObject: PlacesObservableObject
    
    @State var showFavorites = false
    
    var places: [Place] {
        placesObject.places
    }
    
    var placesAreFetched: Bool {
            !places.isEmpty
        }
    
    func fetch() {
        placesObject.fetchPlaces()
    }
    
    func favoritesTapped() {
        showFavorites = true
    }
}

