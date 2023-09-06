import SwiftUI

struct ScrollToolbar: View {
    // MARK: PROPERTIES
    @Binding var tappedOnTitle: Bool

    // MARK: BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    tappedOnTitle = true
                } label: {
                    FilterButtonInToolbar(title: "Vše", tappedOnTitle: $tappedOnTitle)
                }
                ForEach(Kind.allCases, id: \.self) { kind in
                    Button {
                        tappedOnTitle.toggle()
                    } label: {
                        FilterButtonInToolbar(title: kind.rawValue, tappedOnTitle: $tappedOnTitle)
                    }
                }
            }
        }
        .padding()
    }
}

struct ScrollToolbar_Previews: PreviewProvider {
    static var previews: some View {
        ScrollToolbar(tappedOnTitle: .constant(false))
    }
}
