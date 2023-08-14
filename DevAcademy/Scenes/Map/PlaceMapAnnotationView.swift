import SwiftUI

struct PlaceMapAnnotationView: View {
    @Environment(\.colorScheme) var colorScheme
    let placeSymbol: String
    
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
                        .foregroundColor(
                            Color(colorScheme == .dark ? .black : .white))
                        .padding(7)
                        .background(Color.theme.accent)
                        .cornerRadius(36)
                        .shadow(radius: 8)
                }
            }
    }
}

struct PlaceMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
            PlaceMapAnnotationView(placeSymbol: "building.columns")
    }
}
