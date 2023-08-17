import Foundation
import SwiftUI

struct Place: Codable, Equatable, Identifiable {
    var geometry: Point?
    var attributes: Attributes
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.attributes.ogcFid == rhs.attributes.ogcFid
    }
    
    // read only - computed properties, not decoding from API
    // i need this id for MapView with custom pin
    var id: Int {
            attributes.ogcFid
        }
    
    // symbol for pin on map view
    var symbol: Image {
        switch attributes.kind {
        case .kind(.cinema):
            return Image.pinSymbol.cinema
        case .kind(.theatre):
            return Image.pinSymbol.theatre
        case .kind(.gallery):
            return Image.pinSymbol.gallery
        case .kind(.hub):
            return Image.pinSymbol.hub
        case .kind(.musicClub):
            return Image.pinSymbol.musicClub
        case .kind(.summerCinema):
            return Image.pinSymbol.summerCinema
        case .kind(.library):
            return Image.pinSymbol.library
        case .kind(.concertHall):
            return Image.pinSymbol.concertHall
        case .kind(.culturalCentrum):
            return Image.pinSymbol.culturalCentrum
        case .kind(.culturalMonument):
            return Image.pinSymbol.culturalMonument
        case .kind(.museum):
            return Image.pinSymbol.museum
        case .kind(.entrepriseWithCulturalProgramme):
            return Image.pinSymbol.entrepriseWithCulturalProgramme
        case .kind(.exhibitionCentre):
            return Image.pinSymbol.exhibitionCentre
        case .kind(.other):
            return Image.pinSymbol.other
        case .unknown(_):
            return Image.pinSymbol.unknown
        }
    }
}
