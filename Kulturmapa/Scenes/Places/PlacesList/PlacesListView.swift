import SwiftUI

struct PlacesListView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Group {
                if model.places.isNotEmpty {
                   navigationToolbar
                    if model.selectedKind == Kind.all.rawValue {
                        placesList
                    } else {
                        filteredPlacesList
                    }
                } else {
                    LoadingIndicator(width: .bigSize, height: .bigSize)
                }
            }
            .listStyle(.plain)
        }
        .task {
            await model.fetchPlacesData()
        }
    }
}

// MARK: - EXTENSION
extension PlacesListView {
    private var navigationToolbar: some View {
        VStack {
            SearchBarView(searchText: model.$searchQuery)
            FilterToolbarView(selectedKind: model.$selectedKind)
        }
        .backgroundStyle()
    }

    private var placesList: some View {
        List(model.searchedPlaces(), id: \.attributes.ogcFid) { place in
            NavigationLink {
                coordinator.placeDetailScene(with: place)
            } label: {
                PlacesRowView(place: place)
            }
        }
    }

    private var filteredPlacesList: some View {
        List(model.filterPlaces(by: model.selectedKind), id: \.attributes.ogcFid) { place in
            NavigationLink {
                coordinator.placeDetailScene(with: place)
            } label: {
                PlacesRowView(place: place)
            }
        }
    }
}

// MARK: - PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
            .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
            .preferredColorScheme(.dark)
    }
}
