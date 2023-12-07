import Foundation
// MARK: - TEST
// MARK: - ObservableObjects
final class ObservableObjects {
    let places: PlacesObservableObject
    let events: EventsObservableObject

    init(places: PlacesObservableObject, events: EventsObservableObject) {
        self.places = places
        self.events = events
    }
}

// MARK: - ObservableObjects + Extension
extension ObservableObjects {
    convenience init(services: Services) {
        let places = PlacesObservableObject(
            placesService: services.placesService,
            userLocationService: services.userLocationService)
        let events = EventsObservableObject(
            eventsService: services.eventsService)

        self.init(places: places, events: events)
    }
}

// MARK: - MOCKS
extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
