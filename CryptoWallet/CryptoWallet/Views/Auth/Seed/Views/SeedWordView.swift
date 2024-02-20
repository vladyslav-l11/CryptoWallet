//
//  SeedWordView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 13.02.2024.
//

import SwiftUI

struct SeedWordView: View {
    @Binding var rowNumber: Int
    @Binding var word: String
    var isEnabled: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("\(rowNumber).")
                    .foregroundColor(.black)
                TextField(text: $word)
                    .placeholder(Localizable.enterWordPlaceholder,
                                 shouldShow: word.isEmpty)
                    .disabled(!isEnabled)
                    .foregroundColor(.black)
            }
            Divider()
                .frame(height: 2)
                .background(.black)
                .padding(.leading)
        }
    }
}

#Preview {
    SeedWordView(rowNumber: .constant(1),
                 word: .constant(""),
                 isEnabled: false)
}
