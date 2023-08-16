import Foundation

struct Place: Codable, Equatable, Identifiable {
    var id = UUID()
    var geometry: Point?
    var attributes: Attributes
    
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.attributes.ogcFid == rhs.attributes.ogcFid
    }
}
