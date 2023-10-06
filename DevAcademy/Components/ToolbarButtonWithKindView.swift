import SwiftUI

struct ToolbarButtonWithKindView: View {
    // MARK: PROPERTIES
    let title: String
    var isSelected = false

    // MARK: - BODY
    var body: some View {
        Text(title.uppercased())
            .padding([.bottom, .top], 10)
            .padding(.horizontal, 10)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(isSelected ? Color.theme.accent : Color.theme.secondaryTextColor.opacity(0.5)
            )
    }
}

// MARK: - PREVIEW
struct ToolbarButtonWithKindView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                ToolbarButtonWithKindView(title: "Vše")
                ToolbarButtonWithKindView(title: "Podnik s kulturním programem")
                ToolbarButtonWithKindView(title: "Divadlo")
            }
        }
    }
}
