import SwiftUI

struct PlacesRow: View {
    // MARK: PROPERTIES
    let place: Place

    // MARK: BODY
    var body: some View {
        HStack {
            if let imageUrl = place.attributes.imageURL {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 4)
                } placeholder: {
                    // placeholder for image is available, but loading
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.theme.ink)
                        .frame(width: 60, height: 60)
                        .shadow(color: Color.theme.shadow, radius: 2, x: 3, y: 3)
                        .overlay(
                            ProgressView()
                        )
                }
            } else {
                // placeholder for image is missing
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.theme.accent)
                    .frame(width: 60, height: 60)
                    .shadow(color: Color.theme.shadow, radius: 2, x: 3, y: 3)
                    .overlay(
                        Image.otherSymbol.imagePlaceholder
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.theme.ink)
                            .padding(.horizontal, 6)
                    )
            }
            VStack(alignment: .leading) {
                Text(place.attributes.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                Text(place.attributes.kind.rawValue)
                    .font(.footnote)
                    .opacity(0.7)
            }
        }
    }
}

// MARK: PREVIEW
struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(place: Places.mock.places.first!)
    }
}
