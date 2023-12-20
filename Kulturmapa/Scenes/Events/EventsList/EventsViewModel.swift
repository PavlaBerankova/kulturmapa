import MapKit
import SwiftUI

struct EventsViewModel: DynamicProperty {
    @EnvironmentObject private var eventsObservableObject: EventsObservableObject

    var events: [Event] {
        eventsObservableObject.events
    }

    @State var selectedEvent: Event?
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: BrnoCoordinates.latitude.rawValue,
            longitude: BrnoCoordinates.longitude.rawValue),
        span: MKCoordinateSpan(
            latitudeDelta: BrnoCoordinates.coordinateSpan.rawValue, longitudeDelta: BrnoCoordinates.coordinateSpan.rawValue))

    func fetchEventsData() async {
        await eventsObservableObject.fetchEventsData()
    }
}
