import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 1)
            .foregroundColor(.gray)
            .padding(.bottom, 10)
    }
}

#Preview {
    CustomDivider()
}
