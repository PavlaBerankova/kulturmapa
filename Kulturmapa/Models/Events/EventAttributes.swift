import Foundation
import SwiftUI

/*
 https://services6.arcgis.com/fUWVlHWZNxUvTUh8/arcgis/rest/services/Events/FeatureServer/0/query?where=1%3D1&outFields=categories,ID,name,text,tickets,tickets_info,images,url,organizer_email,tickets_url,date_from,date_to&outSR=4326&f=json
*/

struct EventAttributes: Codable {
    var categories: String?
    var id: Int
    var name: String
    var text: String?
    var tickets: String?
    var ticketsInfo: String?
    var imageString: String?
    var url: String?
    var email: String?
    var ticketsUrl: String?
    var timeStampFrom: Int
    var timeStampTo: Int
    
    var image: URL? {
        imageString.flatMap(URL.init(string:))
    }

    enum CodingKeys: String, CodingKey {
        case categories
        case id = "ID"
        case name, text, tickets
        case ticketsInfo = "tickets_info"
        case imageString = "first_image"
        case url
        case email = "organizer_email"
        case ticketsUrl = "tickets_url"
        case timeStampFrom = "date_from"
        case timeStampTo = "date_to"
    }
}

extension EventAttributes {
    var dateFrom: Date {
        Date(timeIntervalSince1970: TimeInterval(timeStampFrom) / 1_000)
    }

    var dateTo: Date {
        Date(timeIntervalSince1970: TimeInterval(timeStampTo) / 1_000)
    }
}
