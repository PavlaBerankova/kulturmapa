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
                    filterToolbar
                    if model.selectedDateFilter == DateFilterTitle.allTime {
                        eventsList
                    } else {
                       filteredEventsList
                    }
                } else {
                    LoadingIndicator(width: .bigSize, height: .bigSize)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Akce v Brně")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                model.countEvents()
            }
        }
        .task {
            await model.fetchEventsData()
        }
    }
}

// MARK: - EXTENSION
extension EventsListView {
    private var eventsList: some View {
        List(model.sortedByDate(model.events), id: \.attributes.id) { event in
            NavigationLink {
                coordinator.eventDetailScene(with: event)
            } label: {
                EventsRowView(event: event)
            }
        }
    }

    private var filterToolbar: some View {
        DateFilterToolbarView(selectedKind: model.$selectedDateFilter)
            .backgroundStyle()
    }

    private var filteredEventsList: some View {
        List(model.filteredEventsList(by: model.selectedDateFilter), id: \.id) { event in
            NavigationLink {
                coordinator.eventDetailScene(with: event)
            } label: {
                EventsRowView(event: event)
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    EventsListView()
        .inject(objects: ObservableObjects(services: Services()), coordinator: Coordinator())
}
