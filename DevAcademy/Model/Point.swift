import Foundation

struct Point: Identifiable, Codable {
    var id = UUID()
    
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        
        case latitude = "y"
        case longitude = "x"
    }
}
