import SwiftUI

struct BackgroundForToolbar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 0)
                    .ignoresSafeArea(edges: .top)
                    .foregroundColor(Color.theme.search)
                    .shadow(color: Color.theme.secondaryTextColor, radius: 2)
            )
    }
}

extension View {
    func backgroundStyle() -> some View {
        modifier(BackgroundForToolbar())
    }
}
