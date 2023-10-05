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
                CustomNavigationToolbarWithPlaceType(selectedKind: model.$selectedKind)
                if model.places.isNotEmpty {
                    if model.selectedKind == "Vše" {
                       placesList
                    } else {
                       filteredPlacesList
                    }
                } else {
                    loadingIndicator
                }
            }
            .listStyle(.plain)
        }
        .task {
            await model.fetchData()
        }
        .searchable(text: model.$searchQuery, prompt: "vyhledat místo")
    }
}

// MARK: - EXTENSION
extension PlacesView {
    private var placesList: some View {
        List(model.searchedPlaces(), id: \.attributes.ogcFid) { place in
            NavigationLink {
                coordinator.placeDetailScene(with: place)
            } label: {
                PlacesRow(place: place)
            }
        }
    }

    private var filteredPlacesList: some View {
        List(model.filterPlaces(by: model.selectedKind), id: \.attributes.ogcFid) { place in
            NavigationLink {
                coordinator.placeDetailScene(with: place)
            } label: {
                PlacesRow(place: place)
            }
        }
    }

    private var loadingIndicator: some View {
        VStack {
            ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 3, lineWidth: 1.5))
                .foregroundColor(Color.theme.accent)
                .frame(width: 150, height: 150)
        }
    }
}

// MARK: - PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesObservableObject(placesService: ProductionPlacesService(), userLocationService: ProductionUserLocationService()))
            .environmentObject(Coordinator())
    }
}
