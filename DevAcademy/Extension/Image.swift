import SwiftUI

extension Image {
    static let pinSymbol = CustomImageSymbol()
    static let tabSymbol = TabViewImageSymbol()
    static let contactsSymbol = ContactsImageSymbol()
}

struct TabViewImageSymbol {
    let list = Image(systemName: "list.bullet")
    let map = Image(systemName: "map")
    let star = Image(systemName: "star")
}

struct ContactsImageSymbol {
    let web = Image(systemName: "network")
    let phone = Image(systemName: "phone")
    let email = Image(systemName: "envelope")
}

// symbol for map pin
struct CustomImageSymbol {
    let cinema = Image("cinema")
    let theatre = Image("theater")
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

// symbol for map pin in version SF symbol, current not in use
struct SFImageSymbol {
    let cinema = Image(systemName: "film")
    let theatre = Image(systemName: "theatermasks.fill")
    let gallery = Image(systemName: "photo.artframe")
    let hub = Image(systemName: "scale.3d")
    let musicClub = Image(systemName: "music.mic")
    let summerCinema = Image(systemName: "moon.stars.fill")
    let library = Image(systemName: "books.vertical")
    let concertHall = Image(systemName: "music.quarternote.3")
    let culturalCentrum = Image(systemName: "house.lodge")
    let culturalMonument = Image(systemName: "pyramid.fill")
    let museum = Image(systemName: "building.columns")
    let entrepriseWithCulturalProgramme = Image(systemName: "music.note.house")
    let exhibitionCentre = Image(systemName: "network")
    let other = Image(systemName: "dot.square.fill")
    let unknown = Image(systemName: "dot.square.fill")
}



