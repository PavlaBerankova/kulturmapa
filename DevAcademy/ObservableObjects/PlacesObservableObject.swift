import Foundation

final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []

    private var rawPlaces: [Place] = [] {
        didSet {
            self.places = rawPlaces
        }
    }

    private let service: PlacesService
    init(service: PlacesService) {
        self.service = service
    }

    private(set) var favouritePlaces: [Int]? {
        get { UserDefaults.standard.array(forKey: "favourites") as? [Int] }
        set { UserDefaults.standard.set(newValue, forKey: "favourites")
            self.places = rawPlaces
        }
    }

    func set(place: Place, favourite: Bool) {
        var favouritePlaces = self.favouritePlaces ?? []
        let placeId = place.attributes.ogcFid

        switch favourite {
        case true:
            if !favouritePlaces.contains(placeId) {
                favouritePlaces.append(placeId)
            }
        case false:
            favouritePlaces.removeAll { $0 == placeId }
        }
        self.favouritePlaces = favouritePlaces
    }

    @MainActor
    func fetchPlacesData() async {
        do {
            let resultPlaces = try await service.fetchPlaces()
            self.rawPlaces = resultPlaces.places
        } catch {
            print(error)
        }
    }
}
