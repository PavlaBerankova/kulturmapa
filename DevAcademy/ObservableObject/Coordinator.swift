import SwiftUI

final class Coordinator: ObservableObject {

    var placesScene: some View {
        PlacesScene()
    }

    func placeDetailScene(with feature: Feature) -> some View {
        PlaceDetail(state: PlaceDetailViewState(feature: feature))
    }
    
    var favoritesScene: some View {
        Text("Zatím tady nic není")
    }
}
