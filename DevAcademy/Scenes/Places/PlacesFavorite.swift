//
//  PlacesFavorite.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 02.08.2023.
//

import SwiftUI

struct PlacesFavorite: View {
    var body: some View {
        ZStack {
            Color.accentColor
            Text("Oblíbená místa")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
    }
}

//struct PlacesFavorite_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacesFavorite()
//    }
//}
