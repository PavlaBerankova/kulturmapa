import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    
    // MARK: PROPERTIES
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject
    @State var isTappedFavorite = false
    
    var place: Place
    init(place: Place) {
        self.place = place
    }
    
    
    // MARK: PLACE MAIN INFORMATION
    var placeImage: String? {
        place.attributes.imageURL
    }
    
    var imageIsFetch: Bool {
        if placeImage != nil {
            return true
        } else {
            return false
        }
    }
    
    var placeName: String {
        place.attributes.title
    }
    
    var kindOfPlace: String {
        place.attributes.kind.rawValue
    }
    
    var placeStreet: String {
        (place.attributes.street ?? "") + " " + (place.attributes.streetNo ?? "")
    }
    
    // MARK: PLACE LINKS
    var placeWeb: String {
        // original URL from JSON return "https://www.example.cz" or return "-" - only 2 cases
        checkAndFixHasprefix(link: place.attributes.web)
    }
    
    var placePhone: String { // place phone return "123456789" or "-"
        place.attributes.phone?.filteringWhiteSpace() ?? "-"
    }
    
    var placeEmail: String {
        place.attributes.email ?? "-"
    }
    
    var programmeIsAvailable: Bool {
        place.attributes.programme != nil
    }
    
    var placeProgramme: String {
        checkAndFixHasprefix(link: place.attributes.programme)
    }
    
    
    
    // MARK: FUNCTIONS
    func addFavorites() {
        isTappedFavorite.toggle()
    }
    
    func checkAndFixHasprefix(link: String?) -> String {
        guard let link = link else {
            return "-"
        }
        
        let httpProtocol = "https://"
        
        if link.hasPrefix("http://") || link.hasPrefix("https://") {
            return link
        } else {
            return httpProtocol + link
        }
    }
    
    func simpleStringUrl(from urlString: String) -> String {
        switch urlString {
        case "-":
            return urlString.self
        default:
            let urlComponents = URLComponents(string: urlString.filteringWhiteSpace())!
            let prefixToRemove = "www."
            let relativeURL = urlComponents.host!
            if relativeURL.hasPrefix(prefixToRemove) {
                return String(relativeURL.dropFirst(prefixToRemove.count))
            }
            return relativeURL
        }
    }
    
    func formatPhoneNumber(_ number: String) -> String {
        switch number {
        case "-":
            return number.self
        default:
            let numberToInt = Int(number)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " " // --> 123 456 789
            let formattedNumber = numberFormatter.string(from: NSNumber(value: numberToInt!)) ?? "-"
            
            return "+420 " + formattedNumber
        }
    }
}
