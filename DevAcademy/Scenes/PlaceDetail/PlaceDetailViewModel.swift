import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    
    // MARK: PROPERTIES
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject
    @State var isTappedFavorite = false
    
    var place: Place
    init(place: Place) {
        self.place = place
    }
    
    
    // MARK: PLACE ATTRIBUTES
    var placeImage: URL {
        place.attributes.imageURL!
    }
    
    var placeName: String {
        place.attributes.title
    }
    
    var kindOfPlace: String {
        place.attributes.kind.rawValue
    }
    
    var placeStreet: String {
        (place.attributes.street ?? "Ulice") + " " + (place.attributes.streetNo ?? "č.p")
    }
    
    var placeWeb: String {
        place.attributes.web ?? "-"
    }
    
    var placePhone: String {
        place.attributes.phone ?? "-"
    }
    
    var placeEmail: String {
        place.attributes.email ?? "-"
    }
    
    var programmeIsAvailable: Bool {
        place.attributes.programme != nil
//        if (place.attributes.programme != nil) {
//            return true
//        } else {
//            return false
//        }
    }
    
    var placeProgramme: String {
        place.attributes.programme ?? ""
    }
    
    
    // MARK: FUNCTIONS
    func addFavorites() {
        isTappedFavorite.toggle()
    }
}

