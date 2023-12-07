import SwiftUI

@main
struct DevAcademyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(PlacesObservableObject(
                    placesService: ProductionPlacesService(), userLocationService: ProductionUserLocationService()))
                .environmentObject(Coordinator())
        }
    }
}
