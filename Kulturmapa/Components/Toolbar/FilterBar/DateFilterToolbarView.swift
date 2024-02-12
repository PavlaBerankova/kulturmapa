import SwiftUI

struct DateFilterToolbarView: View {
    // MARK: - PROPERTIES
    @Binding var selectedKind: DateFilterTitle

    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(DateFilterTitle.allCases, id: \.self) { date in
                    KindToolbarButton(
                        title: date.rawValue,
                        isSelected: selectedKind == date) {
                            selectedKind = date
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
#Preview {
    DateFilterToolbarView(selectedKind: .constant(.current))
}
