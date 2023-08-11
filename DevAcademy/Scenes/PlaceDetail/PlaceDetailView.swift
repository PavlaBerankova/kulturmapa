import ActivityIndicatorView
import SwiftUI

struct PlaceDetailView: View {
    let model: PlaceDetailViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // MARK: Title
                Text(model.placeName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                // MARK: Image
                AsyncImage(url: model.placeImage) {
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(5)
                        .shadow(radius: 4)
                    
                } placeholder: {
                   ProgressView()
                }
                if !model.arrayFavoritesPlaces.isEmpty {
                    Text(model.arrayFavoritesPlaces[0].properties.nazev)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 100)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        model.addPlaceToFavorites()
                    } label: {
                        Image(systemName: model.placeInFavorites ? "star.fill" : "star")
                    }

                }
            }
        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: Places.mock.places.first!))
    }
}

