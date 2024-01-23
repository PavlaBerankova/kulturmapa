import SwiftUI

struct PlacesRowView: View {
    // MARK: PROPERTIES
    let place: Place

    // MARK: - BODY
    var body: some View {
        HStack(alignment: .top) {
            placeImage
            placeTitleWithType
        }
    }
}

// MARK: - EXTENSION
extension PlacesRowView {
    private var placeImage: some View {
        Group {
            if let imageUrl = place.attributes.imageURL {
                StoredAsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 4)
                } placeholder: {
                     // image is available, but loading
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.theme.ink)
                        .frame(width: 60, height: 60)
                        .shadow(color: Color.theme.shadow, radius: 3, x: 2, y: 2)
                        .overlay(
                            LoadingIndicator(width: .smallSize, height: .smallSize))
                }
            } else { // placeholder: image is missing
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.theme.accent)
                    .frame(width: 60, height: 60)
                    .shadow(color: Color.theme.shadow, radius: 3, x: 2, y: 2)
                    .overlay(
                        Image.otherSymbol.imagePlaceholder
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.theme.ink)
                            .padding(.horizontal, 6))
            }
        }
    }

    private var placeTitleWithType: some View {
        VStack(alignment: .leading) {
            Text(place.attributes.title)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(3)

            Text(place.attributes.kind.rawValue)
                .font(.footnote)
                .opacity(0.7)
        }
    }
}

// MARK: - PREVIEW
struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRowView(place: Places.mock.places[0])
    }
}
