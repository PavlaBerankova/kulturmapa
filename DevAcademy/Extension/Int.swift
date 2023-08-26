import Foundation

extension Int {
    func convertDistance() -> String {
        if self <= 999 {
            return "\(self) m" // --> 900 m
        } else {
            let kilometers = Double(self) / 1000.0
            return String(format: "%.1f km", kilometers) // --> 1.5 km
        }
    }
}
