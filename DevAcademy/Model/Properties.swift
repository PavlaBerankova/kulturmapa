import Foundation

struct Properties: Decodable {
    var id = UUID()
    let ogcFid: Int
    let imageURL: URL
    let kind: PossibleKind
    let title: String
    
    enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        case ogcFid = "ogc_fid"
        case imageURL = "obr_id1"
        case kind = "druh"
        case title = "nazev"
        
        
    }
}
