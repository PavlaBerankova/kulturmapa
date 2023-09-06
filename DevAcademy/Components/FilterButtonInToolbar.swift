import SwiftUI

struct FilterButtonInToolbar: View {
    // MARK: PROPERTIES
    let title: Kind.RawValue
    @Binding var tappedOnTitle: Bool

    // MARK: BODY
    var body: some View {
        Text(title)
            .padding([.bottom, .top], 10)
            .padding(.horizontal, 10)
            .font(.headline)
            .foregroundColor(tappedOnTitle ? Color.theme.accent : Color.theme.secondaryTextColor )
    }
}

// MARK: PREVIEW
struct FilterButtonInToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            FilterButtonInToolbar(title: "Vše", tappedOnTitle: .constant(false))
        }
    }
}
