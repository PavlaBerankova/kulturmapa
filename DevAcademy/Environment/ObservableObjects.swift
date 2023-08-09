import Foundation

final class ObservableObjects {
    let places: PlacesObservableObject
    
    init(places: PlacesObservableObject) {
        self.places = places
    }
}

extension ObservableObjects {
    convenience init(services: Services) {
        let places = PlacesObservableObject()
        
        self.init(places: places)
    }
}

extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
