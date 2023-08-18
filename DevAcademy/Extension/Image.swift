import SwiftUI

extension Image {
    static let pinSymbol = CustomImageSymbol()
    static let tabSymbol = TabViewImageSymbol()
}

struct TabViewImageSymbol {
    let list = Image("list")
    let map = Image("map")
    let star = Image("star")
}

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



