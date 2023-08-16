import Foundation

struct Place: Codable, Equatable, Identifiable {
    var geometry: Point?
    var attributes: Attributes
    
    // read only - computed properties, not decoding from API
    // i need this id for MapView with custom pin
    var id: Int {
            attributes.ogcFid
        }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.attributes.ogcFid == rhs.attributes.ogcFid
    }
}
