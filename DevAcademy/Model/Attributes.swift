import Foundation

struct Attributes: Codable {
    var ogcFid: Int
    var imageURL: URL?
    var kind: PossibleKind
    var title: String
    var email: String?
//    var web: URL?
    var programme: URL?
    var street: String?
    var streetNo: String?
    var phone: String?
   
    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case imageURL = "obr_id1"
        case kind = "druh"
        case title = "nazev"
        case email = "email"
//        case web = "web"
        case programme = "program"
        case street = "ulice"
        case streetNo = "cp_co"
        case phone = "telefon"
        
    }
}
