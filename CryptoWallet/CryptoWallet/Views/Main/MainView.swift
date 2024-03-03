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
            ZStack {
                // TODO
            }
            .fullScreened()
            .frame(alignment: .top)
            .background(.white)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
