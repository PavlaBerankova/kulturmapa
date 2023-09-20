import SwiftUI

struct TypeButtonInToolbar: View {
    // MARK: PROPERTIES
    let title: String
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
struct TypeButtonInToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                TypeButtonInToolbar(title: "Vše")
                TypeButtonInToolbar(title: "Podnik s kulturním programem")
                TypeButtonInToolbar(title: "Divadlo")
            }
        }
    }
}
