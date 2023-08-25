import SwiftUI

struct RootView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    
    // MARK: BODY
    var body: some View {
        TabView {
            placesTab
            mapTab
            favoritesTab
        }
    }
}

// MARK: EXTENSION
extension RootView {
    private var placesTab: some View {
        coordinator.placesScene
            .tabItem {
                VStack {
                    Image.tabSymbol.list
                    Text("Místa")
                }
            }
    }

    private var mapTab: some View {
        coordinator.placesMapScene
            .tabItem {
                VStack {
                    Image.tabSymbol.map
                    Text("Mapa")
                }
            }
    }

    private var favoritesTab: some View {
        coordinator.favoritesScene
            .tabItem {
                VStack {
                    Image.tabSymbol.star
                    Text("Oblíbené")
                }
            }
    }
}

// MARK: PREVIEW
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
