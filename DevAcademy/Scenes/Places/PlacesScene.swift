//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 25.07.2023.
//

import SwiftUI

struct PlacesScene: View {
    @State var features: [Feature] = [] //Features.mock.features
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) { feature in
                        PlacesRow(feature: feature)
                            .onTapGesture {
                                onFeatureTapped(feature: feature)
                            }
                    }
                    .animation(.default, value: features)
                    .listStyle(.plain)
                } else {
                    ProgressView()
                }
            }
                    .navigationTitle("Kultůrmapa")
        }
        .onAppear(perform: fetch)
    }
    
    func onFeatureTapped(feature: Feature) {
        features.removeAll(where: { $0.properties.ogcFid == feature.properties.ogcFid})
    }
    
    func fetch() {
        DataService.shared.fetchData { result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error)
            }
        }
    }
}


struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
    }
}
