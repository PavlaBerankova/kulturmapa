import SwiftUI

struct SearchBarView: View {
    // MARK: PROPERTIES
    @Binding var searchText: String

    // MARK: - BODY
    var body: some View {
        HStack {
            Image.otherSymbol.search
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accent)
            TextField("Vyhledat místo", text: $searchText)
            Spacer()
                .overlay(
                    Image.otherSymbol.xmark
                        .padding()
                        .offset(x: 10) // enlarges the click area
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        },
                    alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 3)
                .fill(Color.theme.search)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .shadow(color: Color.theme.shadow.opacity(0.15), radius: 3)
        )
    }
}

// MARK: - PREVIEW
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
    }
}
