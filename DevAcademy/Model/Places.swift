//
//  Features.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 26.07.2023.
//

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
                geometry: Point(latitude: 49.2006, longitude: 16.6097),
                properties: Properties(
                    ogcFid: 2,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Kino Art Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2019, longitude: 16.6151),
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
                geometry: Point(latitude: 49.2072, longitude: 16.6061),
                properties: Properties(
                    ogcFid: 5,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.hudebniKlub),
                    nazev: "Kabinet múz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1894, longitude: 165602),
                properties: Properties(
                    ogcFid: 6,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.knihovna),
                    nazev: "Moravská zemská knihovna"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1914, longitude: 16.6126),
                properties: Properties(
                    ogcFid: 7,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.koncertniHala),
                    nazev: "Janáčkovo divadlo"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2182, longitude: 16.5893),
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
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 11,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Cinema City"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 12,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kino),
                    nazev: "Univerzitní kino Scala"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 13,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.hub),
                    nazev: "Impact Hub"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 14,
                    obrId1: URL(string: "https://picsum.photos/200")!,
                    druh: .kind(.kulturniPamatka),
                    nazev: "Villa Tugendhat"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
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

