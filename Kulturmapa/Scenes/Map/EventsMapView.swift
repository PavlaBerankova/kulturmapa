import MapKit
import SwiftUI

//////////////////////////////////////////////
// MARK: - NOTE: FOR TEST - FOR NOW NOT IN USE
//////////////////////////////////////////////

struct EventsMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = EventsViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                mapViewWithPin
            }
        }
        .task {
            await model.fetchEventsData()
        }
        .sheet(item: model.$selectedEvent) { event in
            coordinator.eventDetailScene(with: event)
        }
    }
}

// MARK: - EXTENSION
extension EventsMapView {
    private var mapViewWithPin: some View {
        Map(coordinateRegion: model.$region,
            showsUserLocation: true,
            annotationItems: model.events) { event in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(latitude: event.geometry?.latitude ?? 0.0, longitude: event.geometry?.longitude ?? 0.0)) {
                            PlaceMapAnnotationView(symbol: Image(systemName: "mappin.circle.fill"))
                                .scaleEffect(model.selectedEvent == event ? 1 : 0.7)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        model.selectedEvent = event
                                    }
                                }
                }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - PREVIEW

#Preview {
    EventsMapView()
        .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
}
