import SwiftUI

struct CustomNavigationToolbarWithPlaceType: View {
    // MARK: PROPERTIES
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        model.placeKind = "Vše"
                    } label: {
                        ToolbarButtonWithKindView(title: "Vše", isSelected: model.placeKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            model.placeKind = kind.rawValue
                        } label: {
                            ToolbarButtonWithKindView(title: kind.rawValue, isSelected: model.placeKind == kind.rawValue)
                        }
                    }
                }
                .padding(5)
            }
        }
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 0)
                .ignoresSafeArea(edges: .top)
                .foregroundColor(Color.theme.search)
                .shadow(color: Color.theme.secondaryTextColor, radius: 2)
        )
    }
}

// MARK: - PREVIEW
struct CustomNavigationToolbarWithPlaceType_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationToolbarWithPlaceType()
    }
}
