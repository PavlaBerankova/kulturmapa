import Foundation

// add force unwrapp to URL(_ string) and delete white space from URL string
extension URL {
    init(_ string: String) {
        self.init(string: "\(string.lowercased().filteringWhiteSpace())")!
    }
}

