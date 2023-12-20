import SwiftUI

struct ImageView: View {
    let imageURL: URL?

    var body: some View {
        Group {
            if let imageURL = imageURL {
                StoredAsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .cornerRadius(2)
                        .shadow(radius: 4)
                } placeholder: {
                    // placeholder for image is available, but loading
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(Color.theme.ink)
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .shadow(color: Color.theme.shadow, radius: 3)
                        .overlay(
                            ProgressView()
                        )
                }
            } else {
                // placeholder for image is missing
                imagePlaceholder
            }
        }
    }
}

extension ImageView {
    private var imagePlaceholder: some View {
        RoundedRectangle(cornerRadius: 2)
            .foregroundColor(Color.theme.light)
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .shadow(color: Color.theme.shadow, radius: 3)
            .overlay(
                Image.otherSymbol.imagePlaceholder
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.theme.accent)
                    .padding(70)
                    .opacity(0.3)
            )
    }
}

#Preview {
    VStack {
        ImageView(imageURL: URL(string: "https://www.gotobrno.cz/wp-content/uploads/2017/07/brno-panorama.jpg"))
        ImageView(imageURL: nil)
    }
}
