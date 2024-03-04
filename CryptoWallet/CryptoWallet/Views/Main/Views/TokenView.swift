//
//  TokenView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 04.03.2024.
//

import SwiftUI

struct TokenView: View {
    var uiImage: UIImage
    var title: LocalizedStringKey
    var action: () -> Void
    
    private var image: some View {
        Image(uiImage: uiImage)
            .resizable()
            .frame(width: 24, height: 24)
    }
    
    private var titleText: Text {
        Text(title)
            .foregroundColor(.black)
    }
    
    private var transactionButton: some View {
        Button(action: {
            action()
        }, label: {
            Text(Localizable.mainTransaction)
                .foregroundStyle(.white)
                .padding(.horizontal)
        })
        .frame(height: 48)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
    
    var body: some View {
        HStack {
            HStack {
                image
                Spacer()
                    .frame(width: 8)
                titleText
            }
            .padding(.leading, 32)
            
            Spacer()
            transactionButton
                .padding(.trailing, 24)
        }
    }
}

#Preview {
    TokenView(uiImage: R.image.icETH()!, title: Localizable.mainEth) {}
}
