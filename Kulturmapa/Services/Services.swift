import Foundation

final class Services {
    let placesService: PlacesService
    let eventsService: EventsService
    let userLocationService: UserLocationService

    init(placesService: PlacesService, eventsService: EventsService, userLocationService: UserLocationService) {
        self.placesService = placesService
        self.eventsService = eventsService
        self.userLocationService = userLocationService
    }
}

extension Services {
    convenience init() {
        let placesService = ProductionPlacesService()
        let eventsService = ProductionEventsService()
        let userLocationService = ProductionUserLocationService()

        self.init(placesService: placesService, eventsService: eventsService, userLocationService: userLocationService)
    }
}

extension Services {
    static let mock = Services(
        placesService: MockPlacesService(),
        eventsService: MockEventsService(),
        userLocationService: ProductionUserLocationService()
    )
}
