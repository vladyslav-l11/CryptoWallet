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
                TextField(Localizable.enterWordPlaceholder, text: $word)
                    .disabled(!isEnabled)
            }
            Divider()
                .frame(height: 2)
                .background(Color.black)
                .padding(.horizontal)
        }
    }
}

#Preview {
    SeedWordView(rowNumber: .constant(1),
                 word: .constant(""),
                 isEnabled: false)
}
