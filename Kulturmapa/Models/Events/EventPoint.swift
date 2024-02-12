import CoreLocation
import Foundation

struct EventPoint: Codable {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }

    var eventCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}
