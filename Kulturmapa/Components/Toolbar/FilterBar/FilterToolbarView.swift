import SwiftUI

struct FilterToolbarView: View {
    // MARK: PROPERTIES
    @Binding var selectedKind: String

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Kind.allCases, id: \.self) { kind in
                    KindToolbarButton(title: kind.rawValue, isSelected: selectedKind == kind.rawValue) {
                        selectedKind = kind.rawValue
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
struct FilterToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        FilterToolbarView(selectedKind: .constant(Kind.theatre.rawValue))
    }
}
