import Foundation

extension String {
    func filteringWhiteSpace() -> String {
        self.filter { !$0.isWhitespace }
    }
}
