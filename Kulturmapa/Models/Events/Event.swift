import Foundation

struct Event: Identifiable, Codable, Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.attributes.id == rhs.attributes.id
    }

    let attributes: EventAttributes
    let geometry: EventPoint?

    var id: Int {
        attributes.id
    }

    var allDaysOfEvent: TimeInterval {
        attributes.dateFrom.timeIntervalSince(attributes.dateTo)
    }
}
