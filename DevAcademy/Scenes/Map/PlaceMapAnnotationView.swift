//
//  PlaceMapAnnotationView.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 11.08.2023.
//

import SwiftUI

struct PlaceMapAnnotationView: View {
    
    let placeSymbol: String
    
    var body: some View {
            VStack(spacing: 0) {
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.black)
                    
                    Image(systemName: placeSymbol)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
//                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(7)
                        .background(Color.theme.accent)
                        .cornerRadius(36)
                        .shadow(radius: 8)
                    
                   
                }
            }
    }
}

struct PlaceMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMapAnnotationView(placeSymbol: "building.columns")
            .previewLayout(.sizeThatFits)
    }
}
