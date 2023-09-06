//
//  SearchBarView.swift
//  DevAcademy
//
//  Created by Pavla Beránková on 06.09.2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
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

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
    }
}
