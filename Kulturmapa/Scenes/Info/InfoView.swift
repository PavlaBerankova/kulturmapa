import SwiftUI

struct InfoView: View {
    let gitHubUrl = UrlStrings.sourceCodeUrl.rawValue

    var body: some View {
        VStack(spacing: 30) {
            Text("Zdrojový kód aplikace najdeš na GitHubu.")
            Link(destination: URL(string: gitHubUrl)!) {
                Image.otherSymbol.gitHub
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    InfoView()
}
