import SwiftUI

@main
struct KulturmapaApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
        }
    }
}
