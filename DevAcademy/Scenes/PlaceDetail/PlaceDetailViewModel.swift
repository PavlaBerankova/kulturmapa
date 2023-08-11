import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    
    @EnvironmentObject private var placesObject: PlacesObservableObject
    @State var placeInFavorites = false
    @State var arrayFavoritesPlaces = [Place]()
    
    private let place: Place
    init(place: Place) {
            self.place = place
        }

    // TITLE
    var placeName: String {
        place.properties.nazev
    }
    
    // IMAGE
    var placeImage: URL {
       place.properties.obrId1
    }
    
    // FUNCTION
    func addPlaceToFavorites() {
        placeInFavorites.toggle()
        print(arrayFavoritesPlaces)
        if placeInFavorites {
            arrayFavoritesPlaces.append(place)
        } else {
            arrayFavoritesPlaces.removeLast()
        }
        
    }
}
