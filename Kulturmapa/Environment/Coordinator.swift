import SwiftUI

final class Coordinator: ObservableObject {
    // MARK: - Places scenes
    var placesScene: some View {
        PlacesListView()
    }

    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: place))
            .presentationDragIndicator(.visible)
    }

    // MARK: - Favorite scene
    var favoritesScene: some View {
        FavoritePlacesView()
    }

    // MARK: - Map scene
    var placesMapScene: some View {
        PlacesMapView()
    }

    // MARK: - Events scenes
        var eventsScene: some View {
            EventsListView()
        }

    func eventDetailScene(with event: Event) -> some View {
        EventDetailView(model: EventDetailViewModel(event: event))
    }
}
