import SwiftUI

struct PlaceMapAnnotationView: View {
    // MARK: PROPERTIES
    let placeSymbol: String
    
    // MARK: BODY
    var body: some View {
            VStack(spacing: 0) {
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.black)
                    
                    Image(systemName: placeSymbol)
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

// MARK: PREVIEW
struct PlaceMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
            PlaceMapAnnotationView(placeSymbol: "building.columns")
    }
}
