//
//  PossibleKind.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 26.07.2023.
//

import Foundation

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
