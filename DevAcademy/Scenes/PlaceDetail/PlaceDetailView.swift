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
                    if let placeImageUrl = model.placeImage {
                        StoredAsyncImage(url: placeImageUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                                .cornerRadius(2)
                                .shadow(radius: 4)
                        } placeholder: {
                            // placeholder for image is available, but loading
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(Color.theme.ink)
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                                .shadow(color: Color.theme.shadow, radius: 3)
                                .overlay(
                                    ProgressView()
                                )
                        }
                    } else {
                        // placeholder for image is missing
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
                            model.isFavourite.wrappedValue.toggle()
                        } label: {
                            ToolbarButtonView(iconName: model.isFavourite.wrappedValue ? "star.fill" : "star")
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
    private var imagePlaceholder: some View {
        RoundedRectangle(cornerRadius: 2)
            .foregroundColor(Color.theme.light)
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .shadow(color: Color.theme.shadow, radius: 3)
            .overlay(
                Image.otherSymbol.imagePlaceholder
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.theme.accent)
                    .padding(70)
                    .opacity(0.3)
            )
    }

    private var mainInformation: some View {
        VStack(alignment: .leading) {
            Text(model.placeName)
                .lineLimit(2)
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Text(model.placeAddress)
                    .lineLimit(2)
                    .opacity(0.7)
                Spacer()
                Image.otherSymbol.locationArrow
                    .foregroundColor(Color.theme.accent)
                Text(model.getDistance())
                    .opacity(0.7)
            }
        }
        .padding(.top, 15)
    }

    private var buttonShowOnMap: some View {
        Button {
            model.openAppleMaps()
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.theme.ink)
                .overlay(
                    HStack {
                        Image.otherSymbol.navigateArrow
                        Text("Navigovat")
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
            .environmentObject(LocationManager())
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
    }
}
