import SwiftUI

final class Coordinator: ObservableObject {
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()
    
    // MARK: Places scenes
    var placesScene: some View {
        PlacesView()
    }
    
    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: place))
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
