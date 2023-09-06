import SwiftUI
import ActivityIndicatorView

struct PlacesView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: BODY
    var body: some View {
        NavigationStack {
            customToolbar
            Group {
                if model.placesAreFetched {
                    if model.buttonKind == "Vše" {
                        List(model.places, id: \.attributes.ogcFid) { place in
                            NavigationLink {
                                coordinator.placeDetailScene(with: place)
                            } label: {
                                PlacesRow(place: place)
                            }
                        }
                    } else {
                        List(model.kindFilter(with: model.buttonKind), id: \.attributes.ogcFid) { place in
                            NavigationLink {
                                coordinator.placeDetailScene(with: place)
                            } label: {
                                PlacesRow(place: place)
                            }
                        }
                    }
                } else {
                    VStack {
                        ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 3, lineWidth: 1.5))
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 150, height: 150)
                    }
                }
            }
           // .padding(.top, 20)
            .listStyle(.plain)
//            .toolbar {
//                VStack {
//                    SearchBarView(searchText: model.$searchText)
//                    ScrollView(.horizontal, showsIndicators: true) {
//                        HStack {
//                            Button {
//                                model.buttonKind = "Vše"
//                            } label: {
//                                KindButtonInToolbar(title: "Vše", isSelected: model.buttonKind == "Vše")
//                            }
//                            ForEach(Kind.allCases, id: \.self) { kind in
//                                Button {
//                                    model.buttonKind = kind.rawValue
//                                } label: {
//                                    KindButtonInToolbar(title: kind.rawValue, isSelected: model.buttonKind == kind.rawValue)
//                                }
//                            }
//                        }
//                    }
//                }
//                //.padding(.top, 20)
//            }
//            .toolbarBackground(Color.theme.lightOne, for: .navigationBar)
//            .toolbarBackground(.visible, for: .navigationBar)
        }
        .task {
            await model.fetchData()
        }
    }
}

extension PlacesView {
    private var customToolbar: some View {
        VStack {
//            SearchBarView(searchText: model.$searchText)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        model.buttonKind = "Vše"
                    } label: {
                        KindButtonInToolbar(title: "Vše", isSelected: model.buttonKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            model.buttonKind = kind.rawValue
                        } label: {
                            KindButtonInToolbar(title: kind.rawValue, isSelected: model.buttonKind == kind.rawValue)
                        }
                    }
                }
                .padding(5)
            }
        }
        .padding(.horizontal)
        .background(
        RoundedRectangle(cornerRadius: 3)
            .ignoresSafeArea(edges: .top)
            .foregroundColor(Color.theme.search)
            .shadow(color: Color.theme.secondaryTextColor, radius: 2)
        )
    }
}

// MARK: PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
