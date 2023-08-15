import Foundation

struct Point: Identifiable, Decodable {
    var id = UUID()
    
    let latitude: Float
    let longitude: Float
    
    enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        
        case latitude = "x"
        case longitude = "y"
    }
}
