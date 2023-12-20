import SwiftUI

struct CircleButtonView: View {
    // MARK: PROPERTIES
    let title: String
    let iconName: String

    // MARK: - BODY
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 40, height: 40)
            .background(
                Circle()
                    .foregroundColor(Color.theme.ink)
                    .opacity(0.7)
            )
    }
}

// MARK: - PREVIEW
struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CircleButtonView(title: "Oblíbené", iconName: "star")
        }
        .previewLayout(.sizeThatFits)
    }
}
