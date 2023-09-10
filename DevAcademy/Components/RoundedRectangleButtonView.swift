import SwiftUI

struct RoundedRectangleButtonView: View {
    // MARK: PROPERTIES
    let title: String

    // MARK: BODY
    var body: some View {
        Text(title)
            .padding([.bottom, .top], 10)
            .padding(.horizontal, 10)
            .font(.footnote)
            .foregroundColor(Color.theme.accent)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(Color.theme.ink)
                    .opacity(0.7)
            )
    }
}

// MARK: PREVIEW
struct RoundedRectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            RoundedRectangleButtonView(title: "podnik s kulturním programem")
        }
    }
}
