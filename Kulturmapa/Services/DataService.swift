import Foundation

// MARK: - NOT USED - FOR NOW

class DataService {
    func fetchData<T: Codable>(from url: String) async throws -> T {
        let session = URLSession.shared
        let url = URL(string: url)

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
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
}
