import Foundation

final class PlacesObservableObject: ObservableObject {
    
    @Published var places: [Place] = []
    
    private let service: PlacesService
    
    init(service: PlacesService) {
        self.service = service
    }
    
    @MainActor
    func fetchPlacesData() async {
        do {
            places = try await service.fetchPlaces().places
        } catch {
            print(error)
        }
    }
}
