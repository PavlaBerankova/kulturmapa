import SwiftUI

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
}

protocol PlacesService {
    func fetchPlaces() async throws -> Places
}

class ProductionPlacesService: PlacesService {
    func fetchPlaces() async throws -> Places {
        let session = URLSession.shared
        let url = URL(string: "https://gis.brno.cz/ags1/rest/services/OMI/omi_ok_kulturni_instituce/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")
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
