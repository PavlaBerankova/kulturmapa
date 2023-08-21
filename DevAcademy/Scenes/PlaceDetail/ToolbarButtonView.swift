import SwiftUI

struct ToolbarButtonView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
            Circle()
                .foregroundColor(.secondary)
                .opacity(0.4)
                .shadow(
                    color: Color.black.opacity(0.5),
                    radius: 10, x: 0, y: 0)
            )
    }
}

struct ToolbarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButtonView(iconName: "star")
            .previewLayout(.sizeThatFits)
    }
}
