import Foundation
import SwiftUI

struct Place: Codable, Equatable, Identifiable {
    var geometry: Point?
    var attributes: Attributes
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.attributes.ogcFid == rhs.attributes.ogcFid
    }
    // read only - computed properties, not decoding from API
    var id: Int {
        attributes.ogcFid
    }
    // symbol for pin on map view
    var symbol: Image {
        switch attributes.kind {
        case .kind(.cinema):
            return Image.mapSymbol.cinema
        case .kind(.theatre):
            return Image.mapSymbol.theatre
        case .kind(.gallery):
            return Image.mapSymbol.gallery
        case .kind(.hub):
            return Image.mapSymbol.hub
        case .kind(.musicClub):
            return Image.mapSymbol.musicClub
        case .kind(.summerCinema):
            return Image.mapSymbol.summerCinema
        case .kind(.library):
            return Image.mapSymbol.library
        case .kind(.concertHall):
            return Image.mapSymbol.concertHall
        case .kind(.culturalCentrum):
            return Image.mapSymbol.culturalCentrum
        case .kind(.culturalMonument):
            return Image.mapSymbol.culturalMonument
        case .kind(.museum):
            return Image.mapSymbol.museum
        case .kind(.entrepriseWithCulturalProgramme):
            return Image.mapSymbol.entrepriseWithCulturalProgramme
        case .kind(.exhibitionCentre):
            return Image.mapSymbol.exhibitionCentre
        case .kind(.other):
            return Image.mapSymbol.other
        case .unknown:
            return Image.mapSymbol.unknown
        }
    }
}
