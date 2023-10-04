import CoreLocation
import Foundation

struct Point: Codable {
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }
}

extension Point {
    var cllocation: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
}
