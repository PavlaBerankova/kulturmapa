import SwiftUI

extension Image {
    static let mapSymbol = MapImageSymbol()
    static let tabSymbol = TabViewImageSymbol()
    static let contactsSymbol = ContactsImageSymbol()
    static let otherSymbol = OtherAppSymbol()
}

struct TabViewImageSymbol {
    let list = Image(systemName: "list.bullet")
    let map = Image(systemName: "map")
    let star = Image(systemName: "star")
    let calendar = Image(systemName: "calendar")
    let info = Image(systemName: "info.circle")
}

struct ContactsImageSymbol {
    let web = Image(systemName: "network")
    let phone = Image(systemName: "phone")
    let email = Image(systemName: "envelope")
    let atSymbol = Image(systemName: "at")
}

// symbol for map pin
struct MapImageSymbol {
    let cinema = Image("cinema")
    let theater = Image("theater")
    let gallery = Image("gallery")
    let hub = Image("hub")
    let musicClub = Image("musicClub")
    let summerCinema = Image("summerCinema")
    let library = Image("library")
    let concertHall = Image("concertHall")
    let culturalCentrum = Image("culturalCentrum")
    let culturalMonument = Image("culturalMonument2")
    let museum = Image("museum")
    let entrepriseWithCulturalProgramme = Image("entrepriseWithCulturalProgramme")
    let exhibitionCentre = Image("exhibitionCentre")
    let other = Image("other")
    let unknown = Image("other")
}

struct OtherAppSymbol {
    let imagePlaceholder = Image(systemName: "photo.artframe")
    let navigateArrow = Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
    let locationArrow = Image(systemName: "location.fill")
    let search = Image(systemName: "magnifyingglass")
    let xmark = Image(systemName: "xmark.circle.fill")
    let info = Image(systemName: "info.circle")
    let gitHub = Image("github")
}
