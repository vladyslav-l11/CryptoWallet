//
//  MainView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 03.03.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { _ in
            VStack(spacing: 12) {
                ForEach(MainViewModel.Tokens.allCases, id: \.self) { item in
                    TokenView(uiImage: item.image, title: item.title) {
                        // TODO
                    }
                }
            }
            .fullScreened()
            .background(.white)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
