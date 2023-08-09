import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    private let place: Place
    
    init(place: Place) {
            self.place = place
        }
    
    var placeName: String {
        place.properties.nazev
    }
    
    var placeImage: URL {
       place.properties.obrId1
    }
}
