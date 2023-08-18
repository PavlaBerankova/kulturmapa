import ActivityIndicatorView
import SwiftUI

struct PlaceDetailView: View {
    // MARK: PROPERTIES
    let model: PlaceDetailViewModel
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    placeImage
                    LazyVStack(alignment: .leading, spacing: 10) {
                        mainInformation
                        buttonShowOnMap
                        ScrollView {
                            placeLinks
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .ignoresSafeArea(edges: .top)
            
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
    private var placeImage: some View {
        AsyncImage(url: model.placeImage) {
            image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .cornerRadius(2)
                .shadow(radius: 4)
            
            
        } placeholder: {
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(Color.theme.ink)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .overlay(
                    ProgressView()
                )
        }
    }
    
    private var mainInformation: some View {
        VStack(alignment: .leading) {
            Text(model.placeName)
                .lineLimit(2)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack {
                Text(model.placeStreet)
                    .opacity(0.7)
                Spacer()
                Image(systemName: "location")
                    .foregroundColor(Color.theme.accent)
                Text("800 m")
                    .opacity(0.7)
            }
        }
    }
    
    private var buttonShowOnMap: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundColor(Color.theme.ink)
                .overlay(
                    HStack {
                        Image.tabSymbol.map
                        Text("Zobrazit na mapě")
                    }
                )
        }
        .padding(.vertical)
    }
    
    
    private var placeLinks: some View {
        VStack {
            PlaceInfoRow(header: "Web", actionLink: model.placeWeb)
            PlaceInfoRow(header: "Telefon", actionLink: model.placePhone)
            PlaceInfoRow(header: "E-mail", actionLink: model.placeEmail)
            if model.programmeIsAvailable {
                PlaceInfoRow(header: "Program", actionLink: model.placeProgramme)
            }
        }
        .padding(.horizontal, 5)
    }
}

// MARK: PREVIEW
struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: Places.mock.places.first!))
    }
}
