import SwiftUI

struct PlacesRow: View {
    // MARK: PROPERTIES
    let place: Place

    // MARK: BODY
    var body: some View {
        HStack {
            placeImage
            VStack(alignment: .leading) {
                placeTitle
                placeKind
            }
        }
    }
}

// MARK: EXTENSION
extension PlacesRow {
    private var placeImage: some View {
        AsyncImage(url: place.attributes.imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 4)
        } placeholder: {
            ProgressView()
        }
    }

    private var placeTitle: some View {
        Text(place.attributes.title)
            .font(.title3)
            .fontWeight(.semibold)
            .lineLimit(3)
    }
    
    private var placeKind: some View {
        Text(place.attributes.kind.rawValue)
            .font(.footnote)
            .opacity(0.7)
    }
}

// MARK: PREVIEW
struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(place: Places.mock.places.first!)
    }
}
