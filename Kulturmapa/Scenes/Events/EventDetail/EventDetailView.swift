import MapKit
import SwiftUI

struct EventDetailView: View {
    // MARK: PROPERTIES
    @Environment(\.dismiss)
    private var dismiss
    let model: EventDetailViewModel

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    eventImage
                    eventTitle
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            eventDate
                            eventTickets
                            if model.ticketWebIsAvailable {
                                eventTicketWeb
                            }
                            if model.emailIsAvailable {
                                eventEmail
                            }
                            if model.webIsAvailable {
                                eventWeb
                            }
                            if model.notesIsAvailable {
                                eventNotes
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .ignoresSafeArea(edges: .top)
            }
            Spacer()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    toolbarBackButton
                }
        }
    }
}

extension EventDetailView {
    private var toolbarBackButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                CircleButtonView(title: "Back button", iconName: "chevron.left")
            }
        }
    }

    private var eventImage: some View {
        ImageView(imageURL: model.eventImage)
    }

    private var eventTitle: some View {
        LazyVStack(alignment: .leading) {
            Text(model.eventName)
                .lineLimit(3)
                .font(.title3)
                .fontWeight(.bold)

            Text(model.eventCategory)
                .lineLimit(2)
                .opacity(0.7)
        }
        .padding(.horizontal)
        .padding(.top, 15)
    }
        private var eventDate: some View {
        RowDetailView(
            header: "Datum konání",
            link: nil,
            linkPlaceholder: nil,
            text: "Od: \(model.eventDateFrom)\nDo: \(model.eventDateTo)")
    }

    private var eventTickets: some View {
        RowDetailView(
            header: "Vstupenky",
            link: nil,
            linkPlaceholder: "",
            text: "\(model.eventTickets)\n\(model.eventTicketsInfo)")
    }

    private var eventTicketWeb: some View {
        RowDetailView(
            header: "Kde koupit vstupenky",
            link: model.eventTicketWeb,
            linkPlaceholder: model.eventTicketWebPlaceholder,
            text: nil)
    }

    private var eventEmail: some View {
        RowDetailView(
            header: "Email",
            link: model.eventEmail,
            linkPlaceholder: model.eventEmail,
            text: nil)
    }

    private var eventWeb: some View {
        RowDetailView(
            header: "Web",
            link: model.eventWeb,
            linkPlaceholder: model.eventWebPlaceholder,
            text: nil)
    }

    private var eventNotes: some View {
        RowDetailView(
            header: "Poznámky",
            link: nil,
            linkPlaceholder: nil,
            text: model.eventNotes)
    }
}

// MARK: - PREVIEW
#Preview {
    EventDetailView(model: EventDetailViewModel(event: Events.mock.events[0]))
}
