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
            eventsTab
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

    private var eventsTab: some View {
        coordinator.eventsScene
            .tabItem {
                VStack {
                    Image.tabSymbol.calendar
                    Text("Akce")
                }
            }
    }
}

// MARK: PREVIEW
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
    }
}
