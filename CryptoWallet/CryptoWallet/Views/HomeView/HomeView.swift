//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 06.02.2024.
//

import SwiftUI
import rswift

struct HomeView: View {
    private var title: some View {
        Text(Localizable.homeTitle)
            .font(.title)
    }
    
    var body: some View {
        VStack {
            title
        }
    }
}

#Preview {
    HomeView()
}
