import Foundation

enum PossibleKind: RawRepresentable, Codable {
    case kind(Kind)
    case unknown(String)

    typealias RawValue = String
    init?(rawValue: String) {
        if let type = Kind(rawValue: rawValue) {
            self = .kind(type)
        } else {
            self = .unknown(rawValue)
        }
    }

    var rawValue: String {
        switch self {
        case .kind(let one):
            return one.rawValue
        case .unknown(let two):
            return two
        }
    }
}
