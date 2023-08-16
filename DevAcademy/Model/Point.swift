import Foundation

struct Point: Codable {
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }
}
