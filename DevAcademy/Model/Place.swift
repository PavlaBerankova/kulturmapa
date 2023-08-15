import Foundation

struct Place: Equatable, Identifiable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
    
    var id = UUID()
    
    let geometry: Point
    let properties: Properties
    var isFavorite = false
}
