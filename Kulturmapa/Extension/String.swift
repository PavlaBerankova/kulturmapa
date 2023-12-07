import Foundation

extension String {
    func filterWhiteSpace() -> String {
        self.filter { !$0.isWhitespace }
    }

    // CHECK URL ADDRESS
    func checkAndFixHasprefix() -> String {
        let httpProtocol = "https://"
        if self.hasPrefix("http://") || self.hasPrefix("https://") {
            return self.filterWhiteSpace()
        } else {
            return httpProtocol + self.filterWhiteSpace()
        }
    }

    func simpleStringFromUrl() -> String {
        if self == "-" {
            return self
        } else {
            let urlComponents = URLComponents(string: self)! // --> http//www.example.com
            let prefixToRemove = "www."
            let relativeURL = urlComponents.host ?? "" // --> www.example.com
            if relativeURL.hasPrefix(prefixToRemove) {
                return String(relativeURL.dropFirst(prefixToRemove.count)) // --> example.com
            }
            return relativeURL
        }
    }

    func filterHtmlCharacters() -> String {
        self.replacingOccurrences(of: "&#8211;", with: "-") // remove this characters from text
            .replacingOccurrences(of: "&nbsp;", with: " ")
    }

    func formatPhoneNumber() -> String { // --> "123456789"
        if self == "0" || self == "-" {
            return "-"
        } else {
            let numberToInt = Int(self)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " " // --> 123 456 789
            let formattedNumber = numberFormatter.string(from: NSNumber(value: numberToInt!)) ?? "-"
            return formattedNumber
        }
    }
}
