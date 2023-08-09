//
//  PlacesFavorite.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 02.08.2023.
//

import SwiftUI

struct FavoritePlacesView: View {
    var body: some View {
        ZStack {
            Color.theme.accent
            Text("Oblíbená místa")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .ignoresSafeArea(edges: .top)
        
    }
}

struct FavoritePlacesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePlacesView()
    }
}
