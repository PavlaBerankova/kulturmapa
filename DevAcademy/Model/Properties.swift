//
//  Properties.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 26.07.2023.
//

import Foundation

struct Properties: Identifiable {
    var id = UUID()
    
    let ogcFid: Int
    let obrId1: URL
    let druh: PossibleKind
    let nazev: String
}
