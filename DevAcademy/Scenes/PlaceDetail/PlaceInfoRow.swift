import SwiftUI

struct PlaceInfoRow: View {
    // MARK: PROPERTIES
    let header: String
    let link: String
    let linkPlaceholder: String

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.footnote)
                .foregroundColor(Color.theme.secondaryTextColor)
            Link(destination: URL(string: link)!) {
                Text(linkPlaceholder)
                    .foregroundColor(Color.theme.accent)
            }
            Divider()
        }
        .padding(.bottom, 5)
    }
}

// MARK: - PREVIEW
struct PlaceInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaceInfoRow(header: "Web", link: "https://www.example.com", linkPlaceholder: "example.com")
    }
}
