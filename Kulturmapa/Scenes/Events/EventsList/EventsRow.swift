import SwiftUI

struct EventsRow: View {
    // MARK: PROPERTIES
    let event: Event

    // MARK: - BODY
    var body: some View {
        HStack {
            eventImage
            eventTitleWithCategory
        }
    }
}

// MARK: - EXTENSION
extension EventsRow {
    private var eventImage: some View {
        Group {
            if let imageUrl = event.attributes.image {
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
                            LoadingIndicator(widthFrame: 30, heightFrame: 30))
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

    private var eventTitleWithCategory: some View {
        VStack(alignment: .leading) {
            Text(event.attributes.name.filterHtmlCharacters())
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(4)

            Text(event.attributes.categories ?? "")
                .font(.footnote)
                .opacity(0.7)
                .lineLimit(2)
            Text("\(event.attributes.dateFrom.dateFormat()) - \(event.attributes.dateTo.dateFormat())")
                .font(.footnote)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    EventsRow(event: Events.mock.events[10])
}
