//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 25.07.2023.
//

import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    let state = PlacesViewState()
    
    var body: some View {
        NavigationStack {
            Group {
                if !state.featuresAreLoaded {
                    List(state.features, id: \.properties.ogcFid) { feature in
                        NavigationLink {
                            PlaceDetail(state: PlaceDetailViewState(feature: feature))
                        } label: {
                            PlacesRow(feature: feature)

                        }
                    }
                    .animation(.default, value: state.features)
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
                                state.showFavorites.toggle()
                            } label: {
                                Image(systemName: "star")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
        }
        .onAppear(perform: state.fetch)
        .sheet(isPresented: state.$showFavorites) {
            PlacesFavorite()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
    
    
}


//struct PlacesScene_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacesScene()
//    }
//}
