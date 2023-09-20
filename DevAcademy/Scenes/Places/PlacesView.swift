import ActivityIndicatorView
import SwiftUI

struct PlacesView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Group {
                if model.placesAreFetched {
                    customNavigationToolbarWithPlaceType
                    if model.placeKind == "Vše" {
                        List(model.places, id: \.attributes.ogcFid) { place in
                            NavigationLink {
                                coordinator.placeDetailScene(with: place)
                            } label: {
                                PlacesRow(place: place)
                            }
                        }
                    } else {
                        List(model.placesFilter(with: model.placeKind), id: \.attributes.ogcFid) { place in
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
            .listStyle(.plain)
        }
        .task {
            await model.fetchData()
        }
    }
}

// MARK: - EXTENSION
extension PlacesView {
    private var customNavigationToolbarWithPlaceType: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        model.placeKind = "Vše"
                    } label: {
                        ToolbarButtonWithKindView(title: "Vše", isSelected: model.placeKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            model.placeKind = kind.rawValue
                        } label: {
                            ToolbarButtonWithKindView(title: kind.rawValue, isSelected: model.placeKind == kind.rawValue)
                        }
                    }
                }
                .padding(5)
            }
        }
        .padding(.horizontal)
        .background(
        RoundedRectangle(cornerRadius: 0)
            .ignoresSafeArea(edges: .top)
            .foregroundColor(Color.theme.search)
            .shadow(color: Color.theme.secondaryTextColor, radius: 2)
        )
    }
}

// MARK: - PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
