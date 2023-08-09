import SwiftUI

struct RootView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        TabView {
            coordinator.placesScene
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Místa")
                    }
                }
            
            coordinator.placesMapScene
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Mapa")
                    }
                }
            
            coordinator.favoritesScene
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Oblíbené")
                    }
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(Coordinator())
            .injectPreviewEnvironment()
    }
}

