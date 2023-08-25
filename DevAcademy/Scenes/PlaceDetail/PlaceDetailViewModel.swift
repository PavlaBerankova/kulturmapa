import MapKit
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
            return place.attributes.imageURL ?? ""
        }
        return "Obrázek není k dispozici"
    }

    var imageIsFetch: Bool {
        guard place.attributes.imageURL != nil else {
            return false
        }
        return true
    }

    // TITLE
    var placeName: String {
        place.attributes.title
    }

    // KIND
    var kindOfPlace: String {
        place.attributes.kind.rawValue
    }

    // ADRESS
    var placeAdress: String {
        (place.attributes.street ?? "") + " " + (place.attributes.streetNo ?? "")
    }

    var placeStreetNo: String {
        place.attributes.streetNo ?? ""
    }

    // MARK: PLACE LINKS
    // WEB
    var placeWeb: String {
        guard let web = place.attributes.web else {
            return "-"
        }
        return checkAndFixHasprefix(link: web).filteringWhiteSpace()
    }

    var webPlaceholder: String {
        simpleStringUrl(from: placeWeb)
    }

    // PHONE
    var placePhone: String { // place phone return "123456789", "0", "-"
        place.attributes.phone?.filteringWhiteSpace() ?? "-"
    }

    var phonePlaceholder: String {
        formatPhoneNumber(placePhone)
    }

    // EMAIL
    var placeEmail: String {
        place.attributes.email?.filteringWhiteSpace() ?? "-"
    }

    // PROGRAMME
    var placeProgramme: String {
        guard let programme = place.attributes.programme else {
            return "-"
        }
        return checkAndFixHasprefix(link: programme)
    }

    var programmeIsAvailable: Bool {
        guard place.attributes.programme != nil else {
            return false
        }
        return true
    }

    // MARK: FUNCTIONS
    func openAppleMaps() {
        let coordinates = CLLocationCoordinate2D(latitude: place.geometry?.latitude ?? 0.0, longitude: place.geometry?.longitude ?? 0.0)
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.phoneNumber = placePhone
        mapItem.url = URL(string: placeWeb)
        mapItem.openInMaps(launchOptions: nil)
    }

    func addFavorites() {
        isTappedFavorite.toggle()
    }

    private func checkAndFixHasprefix(link: String) -> String {
        let httpProtocol = "https://"
        if link.hasPrefix("http://") || link.hasPrefix("https://") {
            return link.filteringWhiteSpace()
        } else {
            return httpProtocol + link.filteringWhiteSpace()
        }
    }

    private func simpleStringUrl(from urlString: String) -> String {
        if urlString == "-" {
            return urlString
        } else {
            let urlComponents = URLComponents(string: urlString)! // --> http//www.example.com
            let prefixToRemove = "www."
            let relativeURL = urlComponents.host ?? "" // --> www.example.com
            if relativeURL.hasPrefix(prefixToRemove) {
                return String(relativeURL.dropFirst(prefixToRemove.count)) // --> example.com
            }
            return relativeURL
        }
    }

    private func formatPhoneNumber(_ number: String) -> String {
        if number == "0" || number == "-" {
            return "-"
        } else {
            let numberToInt = Int(number)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " " // --> 123 456 789
            let formattedNumber = numberFormatter.string(from: NSNumber(value: numberToInt!)) ?? "-"
            return formattedNumber
        }
    }
}
