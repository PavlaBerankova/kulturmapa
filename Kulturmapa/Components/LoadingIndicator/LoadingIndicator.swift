import ActivityIndicatorView
import SwiftUI

struct LoadingIndicator: View {
    // MARK: - PROPERTIES
    let widthFrame: CGFloat
    let heightFrame: CGFloat

    // MARK: - BODY
    var body: some View {
        VStack {
            ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 4, lineWidth: 1.5))
                .foregroundColor(Color.theme.accent)
                .frame(width: widthFrame, height: heightFrame)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    VStack(spacing: 50) {
        LoadingIndicator(widthFrame: 150, heightFrame: 150)
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.theme.ink)
            .frame(width: 60, height: 60)
            .shadow(color: Color.theme.shadow, radius: 3, x: 2, y: 2)
            .overlay(
                LoadingIndicator(
                    widthFrame: 25,
                    heightFrame: 25))
    }


}
