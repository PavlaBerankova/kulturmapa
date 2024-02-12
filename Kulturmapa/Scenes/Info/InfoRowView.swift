import SwiftUI

struct InfoRowView: View {
    // MARK: - PROPERTIES
    let infoImage: Image
    let infoText: String
    let urlString: String
    @State private var isTapped = false

    // MARK: - BODY
    var body: some View {
        Divider()
        HStack(alignment: .top, spacing: 10) {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
                .overlay(
                    infoImage
                        .resizable()
                        .foregroundColor(.white)
                        .padding(infoImage == .contactsSymbol.atSymbol ? 12 : 2)
                )
            Text(infoText)
                .font(.subheadline)
            Spacer()

            Image(systemName: "chevron.right")
                .padding(.vertical)
                .foregroundColor(Color.theme.accent)
        }
        .onTapGesture {
            isTapped.toggle()
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }

            // Set a timer to revert the background color back to clear after a brief period
                       DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                           isTapped = false
                       }
        }
        .padding(10)
        .background(isTapped ? .gray.opacity(0.1) : .clear)
    }
}

// MARK: - PREVIEW
#Preview {
    InfoRowView(infoImage: .otherSymbol.gitHub, infoText: "Zdrojový kód aplikace najdeš na GitHubu.", urlString: UrlStrings.sourceCodeUrl.rawValue)
}
