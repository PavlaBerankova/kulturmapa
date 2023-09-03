import MapKit
import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    // MARK: PROPERTIES
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject
    @EnvironmentObject private var locationManager: LocationManager

    var place: Place
    init(place: Place) {
        self.place = place
    }

    var isFavourite: Binding<Bool> {
            .init {
                placesObservableObject.favouritePlaces?.contains(place.attributes.ogcFid) ?? false
            } set: { newValue in
                placesObservableObject.set(place: place, favourite: newValue)
            }
        }

    // MARK: PLACE MAIN INFORMATION
    // IMAGE
    var placeImage: URL? {
        place.attributes.imageURL
    }

    // TITLE
    var placeName: String {
        place.attributes.title
    }

    // ADDRESS
    var placeAddress: String {
        (place.attributes.street ?? "") + " " + (place.attributes.streetNo ?? "")
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

    // MARK: PLACE AND USER COORDINATE
    var currentPlaceCoordinate: CLLocation {
        let placeLatitude: Double = place.geometry?.latitude ?? 0.0
        let placeLongitude: Double = place.geometry?.longitude ?? 0.0
        return CLLocation(latitude: placeLatitude, longitude: placeLongitude)
    }
    
    var userLocation: CLLocation {
        let coordinateLatitude: Double = locationManager.location?.coordinate.latitude ?? 0.0
        let coordinateLongitude: Double = locationManager.location?.coordinate.longitude ?? 0.0
        return CLLocation(latitude: coordinateLatitude, longitude: coordinateLongitude)
    }

    // MARK: FUNCTIONS
    func getDistance() -> String {
        return Int(currentPlaceCoordinate.distance(from: userLocation)).convertDistance()
    }

    func openAppleMaps() {
        let coordinates = CLLocationCoordinate2D(latitude: place.geometry?.latitude ?? 0.0, longitude: place.geometry?.longitude ?? 0.0)
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.phoneNumber = placePhone
        mapItem.url = URL(string: placeWeb)
        mapItem.openInMaps(launchOptions: nil)
    }

//    func addFavorites() {
//        isTappedFavorite.toggle()
//    }

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
