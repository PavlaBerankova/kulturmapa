import SwiftUI

struct PlaceKindSymbol: View {
    // MARK: PROPERTIES
    let symbol: Image

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.black)
                symbol
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
struct PlaceKindSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceKindSymbol(symbol: Image.mapSymbol.cinema)
            .previewLayout(.sizeThatFits)
    }
}
