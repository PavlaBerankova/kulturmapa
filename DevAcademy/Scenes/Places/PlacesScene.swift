//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 25.07.2023.
//

import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    @State var features: [Feature] = [] //Features.mock.features
    @State var showFavorites = false
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) { feature in
                        NavigationLink {
                            PlaceDetail(feature: feature)
                        } label: {
                            PlacesRow(feature: feature)
//                                .onTapGesture {
//                                    onFeatureTapped(feature: feature)
//                                }
                        }
                    }
                    .animation(.default, value: features)
                    .listStyle(.plain)
                } else {
                    VStack {
                        ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 3, lineWidth: 1.5))
                            .foregroundColor(.accentColor)
                            .frame(width: 150, height: 150)
                    }
                }
            }
                    .navigationTitle("Kultůrmapa")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showFavorites.toggle()
                            } label: {
                                Image(systemName: "star")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
        }
        .onAppear(perform: fetch)
        .sheet(isPresented: $showFavorites) {
            PlacesFavorite()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
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
