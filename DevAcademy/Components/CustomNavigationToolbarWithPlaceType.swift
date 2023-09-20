import SwiftUI

struct CustomNavigationToolbarWithPlaceType: View {
    // MARK: PROPERTIES
    @Binding var selectedKind: String

    // MARK: - BODY
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                       selectedKind = "Vše"
                    } label: {
                        ToolbarButtonWithKindView(title: "Vše", isSelected: selectedKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            selectedKind = kind.rawValue
                        } label: {
                            ToolbarButtonWithKindView(title: kind.rawValue, isSelected: selectedKind == kind.rawValue)
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
        CustomNavigationToolbarWithPlaceType(selectedKind: .constant("Vše"))
    }
}
