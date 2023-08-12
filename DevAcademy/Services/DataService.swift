import Foundation

class DataService {
    private init() {}
    
    static var shared = DataService.init()
    
    var data: Result<Places, Error>?
    
    func fetchData(completion: @escaping (Result<Places, Error>) -> Void) {
        if let data = data {
            completion(data)
            return
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] _ in
            let newData = DataService.mockData
            self?.data = .success(newData)
            completion(.success(newData))
        }
    }
}

extension DataService {
    private static let mockData = Places.mock
}
