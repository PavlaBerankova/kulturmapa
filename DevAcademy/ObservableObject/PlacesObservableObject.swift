import Foundation

final class PlacesObservableObject: ObservableObject {
    
    @Published var places: [Place] = []
    
    private let dataService: DataService = DataService.shared
    
    func fetchPlaces() {
            DataService.shared.fetchData { result in
                switch result {
                case .success(let places):
                    self.places = places.places
                case .failure(let error):
                    print(error)
                }
            }
    }
}
