//
//  DataService.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 26.07.2023.
//

import Foundation

class DataService {
    private init() {}
    
    static var shared = DataService.init()
    
    var data: Result<Features, Error>?
    
    func fetchData(completion: @escaping (Result<Features, Error>) -> Void) {
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
    private static let mockData = Features.mock
}
