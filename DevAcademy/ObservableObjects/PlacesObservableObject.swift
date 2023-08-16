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
//            let result = try await service.fetchPlaces()
//            self.places = result.places
        } catch {
            print(error)
        }
    }
    
//    func fetchPlaces() {
//            dataService.fetchData { result in
//                switch result {
//                case .success(let places):
//                    self.places = places.places
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
}
