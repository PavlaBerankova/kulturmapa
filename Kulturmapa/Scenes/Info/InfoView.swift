import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTIES
    let gitHubUrl = UrlStrings.sourceCodeUrl.rawValue
    let dataBrnoUrl = UrlStrings.dataBrnoUrl.rawValue
    let email = UrlStrings.emailInfo.rawValue

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                linkToGitHub
                linkToDataBrno
                linkToEmail
                Divider()
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal)
            .navigationTitle("O aplikaci")
        }
    }
}

// MARK: - EXTENSION
extension InfoView {
    private var linkToGitHub: some View {
        InfoRowView(
            infoImage: .otherSymbol.gitHub,
            infoText: "Zdrojový kód aplikace najdeš na GitHubu.",
            urlString: gitHubUrl)
    }

    private var linkToDataBrno: some View {
        InfoRowView(
            infoImage: Image(.dataBrno),
            infoText: "Veškerá data jsou převzata z data.brno.cz",
            urlString: dataBrnoUrl)
    }

    private var linkToEmail: some View {
        InfoRowView(
            infoImage: .contactsSymbol.atSymbol,
            infoText: "Máš nápad na vylepšení nebo jsi našel/našla chybu? Napiš mi na email \(email)",
            urlString: "mailto:" + email)
    }
}

// MARK: - PREVIEW
#Preview("Light mode") {
    NavigationStack {
        InfoView()
            .preferredColorScheme(.light)
    }
}

#Preview("Dark mode") {
    NavigationStack {
        InfoView()
            .preferredColorScheme(.dark)
    }
}
