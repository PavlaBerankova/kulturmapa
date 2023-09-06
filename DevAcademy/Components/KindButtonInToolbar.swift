import SwiftUI

struct KindButtonInToolbar: View {
    // MARK: PROPERTIES
    let title: Kind.RawValue
    var isSelected = false

    // MARK: BODY
    var body: some View {
        Text(title.uppercased())
            .padding([.bottom, .top], 10)
            .padding(.horizontal, 10)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(isSelected ? Color.theme.accent : Color.theme.secondaryTextColor)
    }
}

// MARK: PREVIEW
struct KindButtonInToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            KindButtonInToolbar(title: "Vše")
        }
    }
}
