import SwiftUI

struct PlaceInfoRow: View {
    // MARK: PROPERTIES
    let header: String
    let actionLink: String
    
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.footnote)
                .foregroundColor(Color.theme.secondaryTextColor)
            Text(actionLink)
                .foregroundColor(Color.theme.accent)
            Divider()
                .padding(.bottom, 5)
        }
    }
}

// MARK: PREVIEW
struct PlaceInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaceInfoRow(header: "Web", actionLink: "https://www.example.com")
    }
}
