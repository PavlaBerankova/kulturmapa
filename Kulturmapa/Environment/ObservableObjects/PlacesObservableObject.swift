import CoreLocation
import Foundation

final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []

    private let placesService: PlacesService
    private let userLocationService: UserLocationService
    var lastUpdatedLocation: CLLocation?

    private var rawPlaces: [Place] = [] {
        didSet {
            self.places = rawPlaces
        }
    }

    init(placesService: PlacesService, userLocationService: UserLocationService) {
        self.placesService = placesService
        self.userLocationService = userLocationService

        userLocationService.listenDidUpdateLocation { [weak self] location in
            DispatchQueue.main.async {
                self?.locationDidUpdate(location: location)
            }
        }
        checkLocationAuthorization()
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

    func updatePlaces() {
        var regularPlaces = rawPlaces

        if let lastUpdatedLocation = self.lastUpdatedLocation {
            regularPlaces.sort { lPlace, rPlace in
                guard let rPoint = rPlace.geometry?.cllocation else {
                    return false
                }
                guard let lPoint = lPlace.geometry?.cllocation else {
                    return true
                }

                let distanceL = lastUpdatedLocation.distance(from: lPoint)
                let distanceR = lastUpdatedLocation.distance(from: rPoint)

                return distanceL.magnitude < distanceR.magnitude
            }
        }
    }

    @MainActor
    func fetchPlacesData() async {
        do {
            let resultPlaces = try await placesService.fetchPlaces()
            self.rawPlaces = resultPlaces.places
        } catch {
            print(error)
        }
    }

    private func checkLocationAuthorization() {
        userLocationService.listenDidUpdateStatus { [weak self] status in
            switch status {
            case .notDetermined:
                self?.userLocationService.requestAuthorization()
            case .restricted:
                self?.userLocationService.stopUpdatingLocation()
                print("Your location is restricted. Change it in settings.")
            case .denied:
                self?.userLocationService.stopUpdatingLocation()
                print("Your location is denied. Change it in settings.")
            case .authorizedAlways, .authorizedWhenInUse:
                self?.beginLocationUpdate()
            @unknown default:
                break
            }
        }
    }

    private func shouldUpdate(location: CLLocation) -> Bool {
        lastUpdatedLocation.flatMap { $0.distance(from: location).magnitude > 300 } ?? true
    }

    private func beginLocationUpdate() {
        self.userLocationService.startUpdatingLocation()
    }

    private func locationDidUpdate(location: [CLLocation]) {
        guard let userLocation = location.first, shouldUpdate(location: userLocation) else {
            return }
        lastUpdatedLocation = userLocation
        updatePlaces()
    }
}
