import SwiftUI

protocol PlacesService {
    func fetchPlaces() async throws -> Places
}

class ProductionPlacesService: PlacesService {
    func fetchPlaces() async throws -> Places {
        let session = URLSession.shared
        let url = URL(string: UrlStrings.placesUrl.rawValue)
        guard let url = url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await session.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print(response.description)
            throw APIError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(Places.self, from: data)
        } catch {
            print("Error decode: \(error)")
            throw APIError.decodingError(error)
        }
    }
}

class MockPlacesService: PlacesService {
    func fetchPlaces() async throws -> Places {
        Places.mock
    }
}
