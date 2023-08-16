import ActivityIndicatorView
import SwiftUI

struct PlaceDetailView: View {
    // MARK: PROPERTIES
    let model: PlaceDetailViewModel
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                placeTitle
                placeImage
                placeEmail
                Text(model.placeKind)
            }
            .padding(30)
            
            Spacer()
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        model.addFavorites()
                    } label: {
                        Image(systemName: model.isTappedFavorite ? "star.fill" : "star")
                    }
                }
            }
        }
    }
}

// MARK: EXTENSION
extension PlaceDetailView {
    
    private var placeTitle: some View {
        Text(model.placeName)
            .font(.title2)
            .fontWeight(.semibold)
            .lineLimit(1)
    }
    
    private var placeImage: some View {
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
    }
    
    private var placeEmail: some View {
        Text(model.placeEmail ?? "")
            .font(.headline)
            .lineLimit(1)
    }
}

// MARK: PREVIEW
struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: Places.mock.places.first!))
    }
}
