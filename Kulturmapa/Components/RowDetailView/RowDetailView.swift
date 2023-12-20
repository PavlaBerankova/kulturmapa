import SwiftUI

struct RowDetailView: View {
    // MARK: PROPERTIES
    let header: String
    let link: String?
    let linkPlaceholder: String?
    let text: String?

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.footnote)
                // .foregroundColor(Color.theme.secondaryTextColor)
                .foregroundStyle(Color.theme.accent)
            if let linkString = link {
                Link(destination: URL(string: linkString)!) {
                    Text(linkPlaceholder ?? "")
                        .foregroundStyle(Color.theme.textColor)
                        // .foregroundStyle(Color.theme.accent)
                }
            }
            if let textString = text {
                Text(textString)
                    // .foregroundStyle(Color.theme.accent)
            }
            Divider()
        }
        .padding(.bottom, 5)
    }
}

// MARK: - PREVIEW
struct RowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RowDetailView(header: "Web", link: "https://www.example.com", linkPlaceholder: "example.com", text: "Text")
    }
}
