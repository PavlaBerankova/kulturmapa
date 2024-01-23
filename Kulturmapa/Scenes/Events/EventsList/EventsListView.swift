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
                            EventsRowView(event: event)
                        }
                    }
                } else {
                    LoadingIndicator(width: .bigSize, height: .bigSize)
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

// MARK: - PREVIEW
#Preview {
    EventsListView()
        .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
}
