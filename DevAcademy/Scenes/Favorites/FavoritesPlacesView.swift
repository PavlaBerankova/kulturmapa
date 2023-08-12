import SwiftUI

struct FavoritePlacesView: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                }
                .foregroundColor(
                    Color(colorScheme == .dark ? .black : .white))
                .opacity(0.4)
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct FavoritePlacesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePlacesView()
            .environmentObject(PlacesObservableObject())
        
    }
}
