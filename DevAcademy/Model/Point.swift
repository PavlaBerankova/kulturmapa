//
//  Point.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 26.07.2023.
//

import Foundation

struct Point: Identifiable {
    var id = UUID()
    
    let latitude: Float
    let longitude: Float
}
