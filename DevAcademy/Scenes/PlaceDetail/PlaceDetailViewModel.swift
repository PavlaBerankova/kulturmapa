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
    // IMAGE
    var placeImage: String {
        if imageIsFetch {
            return place.attributes.imageURL!
        }
        return "Obrázek není k dispozici"
    }
    
    var imageIsFetch: Bool {
        if attributeIsFetch(place.attributes.imageURL) {
            return true
        }
        return false
    }
    
    // TITLE
    var placeName: String {
        place.attributes.title
    }
    
    // KIND
    var kindOfPlace: String {
        place.attributes.kind.rawValue
    }
    
    // STREET
    var placeStreet: String {
        if attributeIsFetch(place.attributes.street) {
            return place.attributes.street!
        }
        return ""
    }
    
    var placeStreetNo: String {
        if attributeIsFetch(place.attributes.streetNo) {
            return place.attributes.streetNo!
        }
        return ""
    }
    
    
    // MARK: PLACE LINKS
    // WEB
    var placeWeb: String {
        if webIsAvailable {
            return checkAndFixHasprefix(link: place.attributes.web!).filteringWhiteSpace()
        }
        return "-"
    }
    
    var webIsAvailable: Bool {
        if attributeIsFetch(place.attributes.web) {
            return true
        }
        return false
    }
    
    var webPlaceholder: String {
        simpleStringUrl(from: placeWeb)
    }
    
    // PHONE
    var placePhone: String { // place phone return "123456789", "0", "-"
        if attributeIsFetch(place.attributes.phone) {
            return place.attributes.phone!.filteringWhiteSpace()
        }
        return "-"
    }
    
    var phonePlaceholder: String {
        formatPhoneNumber(placePhone)
    }
    
    // EMAIL
    var placeEmail: String {
        if attributeIsFetch(place.attributes.email) {
            return place.attributes.email!.filteringWhiteSpace()
        }
        return "-"
    }
    
    // PROGRAMME
    var placeProgramme: String {
        checkAndFixHasprefix(link: place.attributes.programme!) // can force unwrapp - check value != nil in programmeIsAvailable
    }
    
    var programmeIsAvailable: Bool {
        if attributeIsFetch(place.attributes.programme) {
            return true
        }
        return false
    }
    
    
    // MARK: FUNCTIONS
    func attributeIsFetch(_ attribute: String?) -> Bool {
        if attribute != nil {
            return true
        }
        return false
    }
    
    func addFavorites() {
        isTappedFavorite.toggle()
    }
    
    func checkAndFixHasprefix(link: String) -> String {
        let httpProtocol = "https://"
        
        if link.hasPrefix("http://") || link.hasPrefix("https://") {
            return link
        } else {
            return httpProtocol + link
        }
    }
    
    func simpleStringUrl(from urlString: String) -> String {
        if urlString == "-" {
            return urlString.self
        } else {
            let urlComponents = URLComponents(string: urlString)! // --> http//www.example.com
            let prefixToRemove = "www."
            let relativeURL = urlComponents.host! // --> www.example.com
            if relativeURL.hasPrefix(prefixToRemove) {
                return String(relativeURL.dropFirst(prefixToRemove.count)) // --> example.com
            }
            return relativeURL
        }
    }

    func formatPhoneNumber(_ number: String) -> String {
        switch number {
        case "0":
            return "-"
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
