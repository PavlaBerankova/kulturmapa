import SwiftUI

struct InfoButtonView: View {
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image.otherSymbol.info
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.trailing)
        }
    }
}

#Preview {
    InfoButtonView() { }
}
