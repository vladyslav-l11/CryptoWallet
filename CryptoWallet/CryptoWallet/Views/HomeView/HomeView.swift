//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 06.02.2024.
//

import SwiftUI
import rswift

struct HomeView: View {
    private enum C {
        static let buttonsHeight: CGFloat = 48
        static let cornerRadius: CGFloat = 8
    }
    
    private var title: Text {
        Text(Localizable.homeTitle)
            .font(.title)
    }
    
    private var signIn: some View {
        button(withKey: Localizable.signIn) {
            // TODO
        }
    }
    
    private func text(withKey key: LocalizedStringKey) -> some View {
        Text(key)
            .frame(maxWidth: .infinity, minHeight: C.buttonsHeight)
            .foregroundColor(.white)
            .background(Color.gray)
    }
    
    private func button(withKey key: LocalizedStringKey,
                        action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            text(withKey: key)
        })
        .cornerRadius(C.cornerRadius)
        .clipped()
        .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
    }
    
    var body: some View {
        VStack {
            title
            signIn
        }
    }
}

#Preview {
    HomeView()
}
