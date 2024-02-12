import Foundation

extension Date {
    func dateFormat() -> String {
        DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .none)
    }
}
