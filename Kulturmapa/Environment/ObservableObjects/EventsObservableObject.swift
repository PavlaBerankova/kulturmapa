import Foundation

final class EventsObservableObject: ObservableObject {
    @Published var events: [Event] = []

    private let eventsService: EventsService

    init(eventsService: EventsService) {
        self.eventsService = eventsService
    }

    @MainActor
    func fetchEventsData() async {
        do {
            let resultEvents = try await eventsService.fetchEvents()
            self.events = resultEvents.events
        } catch {
            print(error)
        }
    }
}
