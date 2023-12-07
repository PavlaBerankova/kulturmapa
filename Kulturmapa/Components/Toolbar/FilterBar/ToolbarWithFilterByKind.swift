import SwiftUI

struct ToolbarWithFilterByKind: View {
    // MARK: PROPERTIES
    @Binding var selectedKind: String

    // MARK: - BODY
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                       selectedKind = "Vše"
                    } label: {
                        ButtonWithKindInToolbar(title: "Vše", isSelected: selectedKind == "Vše")
                    }
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Button {
                            selectedKind = kind.rawValue
                        } label: {
                            ButtonWithKindInToolbar(title: kind.rawValue, isSelected: selectedKind == kind.rawValue)
                        }
                    }
                }
                .padding(5)
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
    }
}

// MARK: - PREVIEW
struct ToolbarWithFilterByKind_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarWithFilterByKind(selectedKind: .constant("Vše"))
    }
}
