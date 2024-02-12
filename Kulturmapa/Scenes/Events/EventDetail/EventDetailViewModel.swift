import MapKit
import SwiftUI

struct EventDetailViewModel: DynamicProperty {
    // MARK: PROPERTIES
    @EnvironmentObject private var eventsObservableObject: EventsObservableObject
    var event: Event

    init(event: Event) {
        self.event = event
    }

    // MARK: - EVENT ATTRIBUTES
    // IMAGE
    var eventImage: URL? {
        event.attributes.image
    }

    // NAME
    var eventName: String {
        event.attributes.name.filterHtmlCharacters()
    }

    // CATEGORY
    var eventCategory: String {
        event.attributes.categories ?? ""
    }

    // DATE
    var eventDateFrom: String {
        event.attributes.dateFrom.dateFormat()
    }

    var eventDateTo: String {
        event.attributes.dateTo.dateFormat()
    }

    // TICKETS
    var eventTickets: String {
        event.attributes.tickets ?? ""
    }

    var eventTicketsInfo: String {
        event.attributes.ticketsInfo ?? ""
    }

    var eventTicketWeb: String {
        if let eventTicketWeb = event.attributes.ticketsUrl {
            return eventTicketWeb.checkAndFixHasprefix()
        }
        return ""
    }

    var ticketWebIsAvailable: Bool {
        if eventTicketWeb.isEmpty {
            return false
        }
        return true
    }

    var eventTicketWebPlaceholder: String {
        eventTicketWeb.simpleStringFromUrl()
    }

    // EMAIL
    var eventEmail: String {
        event.attributes.email?.filterWhiteSpace() ?? ""
    }

    var emailIsAvailable: Bool {
        if eventEmail.isEmpty {
            return false
        }
        return true
    }

    // WEB
    var eventWeb: String {
        if let eventWeb = event.attributes.url {
            return eventWeb.checkAndFixHasprefix()
        } else {
            return ""
        }
    }

    var webIsAvailable: Bool {
        if eventWeb.isEmpty {
            return false
        }
        return true
    }

    var eventWebPlaceholder: String {
        eventWeb.simpleStringFromUrl()
    }

    // NOTES
    var eventNotes: String {
        if let eventNotes = event.attributes.text {
            return eventNotes.filterHtmlCharacters()
        }
        return ""
    }

    var notesIsAvailable: Bool {
        if eventNotes.isEmpty {
            return false
        }
        return true
    }

    var eventCoordinate: CLLocationCoordinate2D? {
        if let eventCoordinate = event.geometry?.eventCoordinate {
            let latitude = eventCoordinate.latitude
            let longitude = eventCoordinate.longitude
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        return nil
    }
}
