import ActivityIndicatorView
import SwiftUI

struct PlaceDetailView: View {
    let model: PlaceDetailViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(model.placeName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
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
            .padding(.horizontal)
            .padding(.bottom, 100)
        }
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: Places.mock.places.first!))
    }
}

