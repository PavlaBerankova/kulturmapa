import Foundation

class PlacesObservableObject: ObservableObject {
    
    @Published var features: [Feature] = []
    
    func fetchFeatures() {
            DataService.shared.fetchData { result in
                switch result {
                case .success(let features):
                    self.features = features.features
                case .failure(let error):
                    print(error)
                }
            }
    }
}
