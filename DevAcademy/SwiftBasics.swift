//
//  SwiftBasics.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 18.07.2023.
//

import Foundation

// MARK: Úkol 1
enum Kind: String {
    case divadlo = "Divadlo"
    case galerie = "Galerie"
    case hub = "Hub"
    case hudebniKlub = "Hudební klub"
    case kino = "Kino"
    case knihovna = "Knihovna"
    case koncertniHala = "Koncertní hala"
    case kulturniCentrum = "Kulturní centrum"
    case kulturniPamatka = "Kulturní památka"
    case muzeum = "Muzeum"
    case podnikSKulturnimProgramem = "Podnik s kultruním programem"
    case vystavste = "Výstaviště"
    case ostatni = "Ostatní"
}

enum PossibleKind: RawRepresentable {
    
    case kind(Kind)
    case unknown(String)
    
    typealias RawValue = String
    
    init?(rawValue: String) {
        if let x = Kind.init(rawValue: rawValue) {
            self = .kind(x)
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




// MARK: Úkol 2
struct Properties {
    let ogcFid: Int
    let obrId1: URL
    let druh: PossibleKind
    let název: String
}

struct Point {
    let latitude: Float
    let longitude: Float
}

struct Feature {
    let geometry: Point
    let properties: Properties
}

struct Features {
    let features: [Feature]
}


// MARK: Úkol 3 a 4
class DataService {
    private init() {}
    
    static var shared = DataService.init()
    
    var data: Result<Features, Error>?
    
    func fetchData(completion: @escaping (Result<Features, Error>) -> Void) {
        if let data = data {
            completion(data)
            return
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] _ in
            let newData = DataService.mockData
            self?.data = .success(newData)
            completion(.success(newData))
        }
    }
}

extension DataService {
    private static var mockData: Features = Features(features: [Feature(geometry: Point(latitude: 0.0, longitude: 0.0), properties: Properties(ogcFid: 0, obrId1: URL(string: "https://picture.com/obrId1.jpg")!, druh: PossibleKind.kind(Kind.divadlo), název: "Placeholder"))])
}






