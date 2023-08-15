import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    
    @EnvironmentObject private var placesObject: PlacesObservableObject
    @State var isTappedFavorite = false
    
    var place: Place
    init(place: Place) {
        self.place = place
    }
    
    var placeName: String {
        place.properties.nazev
    }
    
    var placeImage: URL {
        place.properties.obrId1
    }
    
    func addFavorites() {
        isTappedFavorite.toggle()
    }
}

