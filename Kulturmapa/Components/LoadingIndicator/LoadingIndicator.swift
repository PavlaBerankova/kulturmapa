import ActivityIndicatorView
import SwiftUI

struct LoadingIndicator: View {
    // MARK: BODY
    var body: some View {
        VStack {
            ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 3, lineWidth: 1.5))
                .foregroundColor(Color.theme.accent)
                .frame(width: 150, height: 150)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    LoadingIndicator()
}
