import Foundation
/*
 https://gis.brno.cz/ags1/rest/services/OMI/omi_ok_kulturni_instituce/FeatureServer/0/query?where=1%3D1&outFields=nazev,druh,web,program,ulice,cp_co,email,telefon,obr_id1&outSR=4326&f=json
*/
struct Places: Codable {
    let places: [Place]
    
    enum CodingKeys: String, CodingKey {
           case places = "features"
       }
}

extension Places {
    static let mock: Places = Places(
        places: [
            Place(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                attributes: Properties(
                    ogcFid: 1,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.theatre),
                    title: "Národní divadlo Brno",
                    email: "example@email.cz"
                    
                )
            ),
            Place(
                geometry: Point(latitude: 49.1933497630688, longitude: 16.6084633834713),
                attributes: Properties(
                    ogcFid: 2,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.cinema),
                    title: "Kino Art Brno",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1916199895607, longitude: 16.6089013382922),
                attributes: Properties(
                    ogcFid: 3,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.museum),
                    title: "Moravské zemské muzeum",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2079, longitude: 16.5938),
                attributes: Properties(
                    ogcFid: 4,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.culturalCentrum),
                    title: "BOUFOU Prostějovská Brno",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1956226179833, longitude: 49.1956226179833),
                attributes: Properties(
                    ogcFid: 5,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.musicClub),
                    title: "Kabinet múz",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2086480342581, longitude: 16.5940280296871),
                attributes: Properties(
                    ogcFid: 6,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.library),
                    title: "Moravská zemská knihovna",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1982348632408, longitude: 16.6110429873691),
                attributes: Properties(
                    ogcFid: 7,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.concertHall),
                    title: "Janáčkovo divadlo",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1948461200546, longitude: 16.5993413922382),
                attributes: Properties(
                    ogcFid: 8,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.culturalMonument),
                    title: "Špilberk Brno",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1920, longitude: 16.6071),
                attributes: Properties(
                    ogcFid: 9,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.summerCinema),
                    title: "Letní kino Lužánky",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 10,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.entrepriseWithCulturalProgramme),
                    title: "Bar, který neexistuje",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1932761716046, longitude: 49.1932761716046),
                attributes: Properties(
                    ogcFid: 11,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.cinema),
                    title: "Cinema City",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1974013176813, longitude: 16.6080967817),
                attributes: Properties(
                    ogcFid: 12,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.cinema),
                    title: "Univerzitní kino Scala",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.190277250277, longitude: 16.6206264473469),
                attributes: Properties(
                    ogcFid: 13,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.hub),
                    title: "Impact Hub",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2071644259188, longitude: 16.6160599462378),
                attributes: Properties(
                    ogcFid: 14,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.culturalMonument),
                    title: "Villa Tugendhat",
                    email: "example@email.cz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1877267709582, longitude: 16.5822648213652),
                attributes: Properties(
                    ogcFid: 15,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    kind: .kind(.exhibitionCentre),
                    title: "Brněnské výstaviště",
                    email: "example@email.cz"
                )
            )
        ]
    )
}


