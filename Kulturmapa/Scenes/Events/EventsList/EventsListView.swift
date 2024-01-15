import SwiftUI

struct EventsListView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = EventsViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Group {
                if model.events.isNotEmpty {
                    List(model.events, id: \.attributes.id) { event in
                        NavigationLink {
                            coordinator.eventDetailScene(with: event)
                        } label: {
                            EventsRow(event: event)
                        }
                    }
                } else {
                    LoadingIndicator(widthFrame: 150, heightFrame: 150)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Akce v Brně")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await model.fetchEventsData()
        }
    }
}

#Preview {
    EventsListView()
        .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
}
