import ActivityIndicatorView
import SwiftUI

struct LoadingIndicator: View {
    // MARK: - PROPERTIES
    let width: SizeLoadingIndicator
    let height: SizeLoadingIndicator
    var title: String {
        if width == .bigSize && height == .bigSize {
            return "Načítám data"
        } else {
            return ""
        }
    }

    // MARK: - BODY
    var body: some View {
        VStack {
           Text(title)
                .padding()
                .frame(width: width.rawValue, height: height.rawValue, alignment: .center)
                .overlay(
                    ActivityIndicatorView(
                        isVisible: .constant(true),
                        type: .arcs(
                            count: 4,
                            lineWidth: 1.5))
                        .foregroundColor(Color.theme.accent)
                        .frame(width: width.rawValue, height: height.rawValue)
                )
        }
    }
}

// MARK: - PREVIEW
#Preview("Light") {
    VStack(spacing: 50) {
        LoadingIndicator(width: .bigSize, height: .bigSize)
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.theme.ink)
            .frame(width: 60, height: 60)
            .shadow(color: Color.theme.shadow, radius: 3, x: 2, y: 2)
            .overlay(
                LoadingIndicator(
                    width: .smallSize,
                    height: .smallSize))
    }
    .preferredColorScheme(.light)
}

#Preview("Dark") {
    VStack(spacing: 50) {
        LoadingIndicator(width: .bigSize, height: .bigSize)
        RoundedRectangle(cornerRadius: 8)
            .foregroundColor(Color.theme.ink)
            .frame(width: 60, height: 60)
            .shadow(color: Color.theme.shadow, radius: 3, x: 2, y: 2)
            .overlay(
                LoadingIndicator(
                    width: .smallSize,
                    height: .smallSize))
    }
    .preferredColorScheme(.dark)
}
