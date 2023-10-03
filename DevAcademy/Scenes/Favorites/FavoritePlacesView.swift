import SwiftUI

struct FavoritePlacesView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            if model.favPlaces.isNotEmpty {
                List(model.showFavoritePlaces(), id: \.attributes.ogcFid) { place in
                    NavigationLink {
                        coordinator.placeDetailScene(with: place)
                    } label: {
                        PlacesRow(place: place)
                    }
                }
                .animation(.default, value: model.places)
                .listStyle(.plain)
                .navigationTitle("Oblíbená místa")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                placeholderScreen
            }
        }
    }
}

// MARK: - EXTENSION
extension FavoritePlacesView {
    private var placeholderScreen: some View {
        ZStack {
            Color.theme.accent
            VStack {
                Text("Tvoje oblíbená místa")
                    .font(.title)
                    .fontWeight(.medium)
                    .lineLimit(2)
                Text("(žádná tu zatím nemáš)")
                    .font(.title2)
                    .lineLimit(3)
                    .padding(.top, 5)
                    .padding(.bottom, 100)
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

// MARK: - PREVIEW
struct FavoritePlacesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePlacesView()
            .environmentObject(Coordinator())
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
    }
}
