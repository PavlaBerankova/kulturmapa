import Foundation

enum Kind: String {
    case theatre = "Divadlo"
    case gallery = "Galerie"
    case hub = "Hub"
    case musicClub = "Hudební klub"
    case cinema = "Kino"
    case summerCinema = "Letní kino"
    case library = "Knihovna"
    case concertHall = "Koncertní hala"
    case culturalCentrum = "Kulturní centrum"
    case culturalMonument = "Kulturní památka"
    case museum = "Muzeum"
    case entrepriseWithCulturalProgramme = "Podnik s kultruním programem"
    case exhibitionCentre = "Výstaviště"
    case other = "Ostatní"
    
    enum CodingKeys: String, CodingKey {
        case theatre = "divadlo"
        case gallery = "galerie"
        case hub = "hub"
        case musicClub = "hudebniKlub"
        case cinema = "kino"
        case summerCinema = "letniKino"
        case library = "knihovna"
        case concertHall = "koncertniHala"
        case culturalCentrum = "kulturniCentrum"
        case culturalMonument = "kulturniPamatka"
        case museum = "muzeum"
        case entrepriseWithCulturalProgramme = "podnikSKulturnimProgramem"
        case exhibitionCentre = "vystaviste"
        case other = "ostatni"
    }
}
