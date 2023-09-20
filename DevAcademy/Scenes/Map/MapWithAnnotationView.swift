import SwiftUI

struct MapWithAnnotationView: View {
    // MARK: PROPERTIES
    let kindSymbol: Image

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.black)
                kindSymbol
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.theme.ink)
                    .padding(7)
                    .background(Color.theme.accent)
                    .cornerRadius(36)
                    .shadow(radius: 8)
            }
        }
    }
}

// MARK: - PREVIEW
struct MapWithAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapWithAnnotationView(kindSymbol: Image.mapSymbol.cinema)
            .previewLayout(.sizeThatFits)
    }
}
