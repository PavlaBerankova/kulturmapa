import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PlacesScene()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Seznam")
                }
            
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Mapa")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
