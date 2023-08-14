import Foundation

struct Places {
    let places: [Place]
}

extension Places {
    static let mock: Places = Places(
        places: [
            Place(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                properties: Properties(
                    ogcFid: 1,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.divadlo),
                    nazev: "Národní divadlo Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1933497630688, longitude: 16.6084633834713),
                properties: Properties(
                    ogcFid: 2,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Kino Art Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1916199895607, longitude: 16.6089013382922),
                properties: Properties(
                    ogcFid: 3,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.muzeum),
                    nazev: "Moravské zemské muzeum"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2079, longitude: 16.5938),
                properties: Properties(
                    ogcFid: 4,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniCentrum),
                    nazev: "BOUFOU Prostějovská Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1956226179833, longitude: 49.1956226179833),
                properties: Properties(
                    ogcFid: 5,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.hudebniKlub),
                    nazev: "Kabinet múz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2086480342581, longitude: 16.5940280296871),
                properties: Properties(
                    ogcFid: 6,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.knihovna),
                    nazev: "Moravská zemská knihovna"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1982348632408, longitude: 16.6110429873691),
                properties: Properties(
                    ogcFid: 7,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.koncertniHala),
                    nazev: "Janáčkovo divadlo"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1948461200546, longitude: 16.5993413922382),
                properties: Properties(
                    ogcFid: 8,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniPamatka),
                    nazev: "Špilberk Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1920, longitude: 16.6071),
                properties: Properties(
                    ogcFid: 9,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.letniKino),
                    nazev: "Letní kino Lužánky"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 10,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.podnikSKulturnimProgramem),
                    nazev: "Bar, který neexistuje"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1932761716046, longitude: 49.1932761716046),
                properties: Properties(
                    ogcFid: 11,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Cinema City"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1974013176813, longitude: 16.6080967817),
                properties: Properties(
                    ogcFid: 12,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Univerzitní kino Scala"
                )
            ),
            Place(
                geometry: Point(latitude: 49.190277250277, longitude: 16.6206264473469),
                properties: Properties(
                    ogcFid: 13,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.hub),
                    nazev: "Impact Hub"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2071644259188, longitude: 16.6160599462378),
                properties: Properties(
                    ogcFid: 14,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniPamatka),
                    nazev: "Villa Tugendhat"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1877267709582, longitude: 16.5822648213652),
                properties: Properties(
                    ogcFid: 15,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.vystaviste),
                    nazev: "Brněnské výstaviště"
                )
            )
        ]
    )
}


