//
//  PlacesRowLive.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 25.07.2023.
//

import SwiftUI

struct PlacesRow: View {
    let place: Place
    
    var body: some View {
        HStack {
            AsyncImage(url: place.properties.obrId1) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
               ProgressView()
            }
                
            VStack(alignment: .leading) {
                Text(place.properties.nazev)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(place.properties.druh.rawValue)
                    .foregroundColor(Color.theme.secondaryTextColor)
                    .font(.subheadline)
            }
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(place: Places.mock.places.first!)
    }
}
