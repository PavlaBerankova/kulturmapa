import SwiftUI

protocol EventsService {
    func fetchEvents() async throws -> Events
}

class ProductionEventsService: EventsService {
    func fetchEvents() async throws -> Events {
        let session = URLSession.shared
        let url = URL(string: "https://services6.arcgis.com/fUWVlHWZNxUvTUh8/arcgis/rest/services/Events/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")
        guard let url = url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await session.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(Events.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
}

class MockEventsService: EventsService {
    func fetchEvents() async throws -> Events {
        Events.mock
    }
}
