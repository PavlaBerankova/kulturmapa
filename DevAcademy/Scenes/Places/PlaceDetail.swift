//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 01.08.2023.
//

import ActivityIndicatorView
import SwiftUI

struct PlaceDetail: View {
    let state: PlaceDetailViewState
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(state.placesName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                AsyncImage(url: state.placesImage) {
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(5)
                        .shadow(radius: 4)
                    
                } placeholder: {
                   ProgressView()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 100)
        }
    }
}

//struct PlaceDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceDetail(state: PlaceDetailViewState(feature: Features.mock.features[0]))
//    }
//}

