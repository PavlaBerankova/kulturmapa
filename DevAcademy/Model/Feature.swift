//
//  Feature.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 26.07.2023.
//

import Foundation

struct Feature: Equatable {
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
    
    let geometry: Point
    let properties: Properties
}
