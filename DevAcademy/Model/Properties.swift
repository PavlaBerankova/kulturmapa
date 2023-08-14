import Foundation

struct Properties: Identifiable {
    var id = UUID()
    
    let ogcFid: Int
    let obrId1: URL
    let druh: PossibleKind
    let nazev: String
}
