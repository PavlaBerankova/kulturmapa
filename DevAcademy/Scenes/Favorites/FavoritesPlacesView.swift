import SwiftUI

struct FavoritePlacesView: View {
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.accent
                VStack(spacing: 100) {
                    Text("Tvoje oblíbená místa")
                        .font(.title)
                        .fontWeight(.medium)
                        .lineLimit(1)
                        
                    Image(systemName: "star")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 150, height: 150)
                        .fontWeight(.ultraLight)
                        .shadow(color: Color.theme.ink, radius: 2)
                }
                .foregroundColor(Color.theme.ink)
                .opacity(0.4)
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

// MARK: PREVIEW
struct FavoritePlacesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePlacesView()
    }
}
