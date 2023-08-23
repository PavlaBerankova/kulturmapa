import ActivityIndicatorView
import SwiftUI

struct PlaceDetailView: View {
    // MARK: PROPERTIES
    @Environment(\.dismiss) private var dismiss
    let model: PlaceDetailViewModel
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if model.imageIsFetch {
                        placeImage
                    } else {
                        imagePlaceholder
                    }
                    LazyVStack(alignment: .leading, spacing: 10) {
                        mainInformation
                        buttonShowOnMap
                        ScrollView {
                          placeLinks
                        }
                    }
                    .padding(.horizontal)
                }
                .ignoresSafeArea(edges: .top)
            }
            Spacer()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            model.addFavorites()
                        } label: {
                            ToolbarButtonView(iconName: model.isTappedFavorite ? "star.fill" : "star")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            ToolbarButtonView(iconName: "chevron.left")
                        }
                    }
                }
        }
    }
}

// MARK: EXTENSION
extension PlaceDetailView {
  private var placeImage: some View {
      AsyncImage(url: URL(string: model.placeImage)) {
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
    
    private var imagePlaceholder: some View {
        RoundedRectangle(cornerRadius: 2)
            .foregroundColor(Color.theme.ink)
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .overlay(
                Text(model.placeImage)
                    .font(.title2)
                    .foregroundColor(Color.theme.accent)
                    .opacity(0.5), alignment: .center
            )
    }
    
    private var mainInformation: some View {
        VStack(alignment: .leading) {
            Text(model.placeName)
                .lineLimit(2)
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Text(model.placeStreet + " " + model.placeStreetNo)
                    .lineLimit(2)
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
                .frame(height: 50)
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
            PlaceInfoRow(header: "Web", link: model.placeWeb, linkPlaceholder: model.webPlaceholder)
            
            PlaceInfoRow(header: "Telefon", link: "tel://" + model.placePhone, linkPlaceholder: model.phonePlaceholder)
            
            PlaceInfoRow(header: "E-mail", link: "mailto:" + model.placeEmail, linkPlaceholder: model.placeEmail)
            
            if model.programmeIsAvailable {
                PlaceInfoRow(header: "Program", link: model.placeProgramme, linkPlaceholder: "přejít na program")
            }
        }
    }
}


// MARK: PREVIEW
struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: Places.mock.places.first!))
    }
}
