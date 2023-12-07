import SwiftUI

struct KindToolbarButton: View {
    // MARK: PROPERTIES
    let title: String
    var isSelected = false
    var action: () -> Void

    // MARK: - BODY
    var body: some View {
        Button {
            action()
        } label: {
            Text(title.uppercased())
                .padding([.bottom, .top], 10)
                .padding(.horizontal, 10)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(isSelected ? Color.theme.accent : Color.theme.secondaryTextColor.opacity(0.5)
                )
        }
    }
}

// MARK: - PREVIEW
struct KindToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                KindToolbarButton(title: Kind.allKinds.rawValue, action: {})
                KindToolbarButton(title: Kind.entrepriseWithCulturalProgramme.rawValue, action: {})
                KindToolbarButton(title: Kind.theatre.rawValue, isSelected: true, action: {})
            }
        }
    }
}
