import MapKit
import SwiftUI

struct EventsViewModel: DynamicProperty {
    @EnvironmentObject private var eventsObservableObject: EventsObservableObject

    var events: [Event] {
        eventsObservableObject.events
    }

    @State var selectedEvent: Event?
    @State var selectedDateFilter = DateFilterTitle.allTime
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: BrnoCoordinates.latitude.rawValue,
            longitude: BrnoCoordinates.longitude.rawValue),
        span: MKCoordinateSpan(
            latitudeDelta: BrnoCoordinates.coordinateSpan.rawValue, longitudeDelta: BrnoCoordinates.coordinateSpan.rawValue))

    func fetchEventsData() async {
        await eventsObservableObject.fetchEventsData()
    }

    func filteredEventsList(by time: DateFilterTitle) -> [Event] {
        let currentDate = Date.now

        switch time {
        case .current:
            return sortedByDate(events.filter { currentDate >= $0.attributes.dateFrom && currentDate <= $0.attributes.dateTo })
        case .upcoming:
            return sortedByDate(events.filter { currentDate <= $0.attributes.dateFrom && currentDate <= $0.attributes.dateTo })
        default:
            return events
        }
    }

    func sortedByDate(_ events: [Event]) -> [Event] {
        events.sorted { $0.attributes.dateFrom < $1.attributes.dateFrom }
    }

    func countEvents() {
        print("All \(events.count)")
        print("Current \(filteredEventsList(by: .current).count)")
        print("Upcoming \(filteredEventsList(by: .upcoming).count)")
    }
}
