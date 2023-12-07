import SwiftUI

final class Coordinator: ObservableObject {
    // MARK: Places scenes
    var placesScene: some View {
        PlacesListView()
    }

    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: place))
            .presentationDragIndicator(.visible)
    }

    // MARK: Favorite scenes
    var favoritesScene: some View {
        FavoritePlacesView()
    }

    // MARK: Map scenes
    var placesMapScene: some View {
        PlacesMapView()
    }
}
