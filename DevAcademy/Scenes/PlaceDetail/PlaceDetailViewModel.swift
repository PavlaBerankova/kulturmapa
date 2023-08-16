import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    
    @EnvironmentObject private var placesObject: PlacesObservableObject
    @State var isTappedFavorite = false
    
    var place: Place
    init(place: Place) {
        self.place = place
    }
    
    var placeName: String {
        place.attributes.title
    }
    
    var placeImage: URL {
        place.attributes.imageURL!
    }
    
    var placeEmail: String? {
        place.attributes.email
    }
    
    func addFavorites() {
        isTappedFavorite.toggle()
    }
}

