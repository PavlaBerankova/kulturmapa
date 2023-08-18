import SwiftUI

struct ButtonView: View {
    // MARK: PROPERTIES
    let symbol = Image.tabSymbol.map
    let titleButton = "Zobrazit na mapě"
    
    var body: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundColor(Color.theme.ink)
                .overlay(
                    HStack {
                        symbol
                        Text(titleButton)
                    }
                )
        }
        .padding(.vertical)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ButtonView()
        }
        .padding(20)
    }
}
