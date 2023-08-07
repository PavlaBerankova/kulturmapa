import SwiftUI

struct PlacesViewState: DynamicProperty {
    
    @EnvironmentObject private var placesObject: PlacesObservableObject
    
    @State var showFavorites = false
    
    var features: [Feature] {
        placesObject.features
    }
    
    var featuresAreLoaded: Bool {
            !features.isEmpty
        }
    
    func fetch() {
        placesObject.fetchFeatures()
    }
    
    func favoritesTapped() {
        showFavorites = true
    }
}

