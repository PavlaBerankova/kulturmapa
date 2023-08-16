import SwiftUI

@main
struct DevAcademyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(PlacesObservableObject())
                .environmentObject(Coordinator())
        }
    }
}
