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
                    CustomNavigationToolbarWithPlaceType(selectedKind: model.$selectedKind)
                    if model.selectedKind == "Vše" {
                        List(model.places, id: \.attributes.ogcFid) { place in
                            NavigationLink {
                                coordinator.placeDetailScene(with: place)
                            } label: {
                                PlacesRow(place: place)
                            }
                        }
                    } else {
                        List(model.placesFilter(with: model.selectedKind), id: \.attributes.ogcFid) { place in
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

// MARK: - PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
