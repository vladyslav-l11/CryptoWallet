//
//  ContentView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 05.02.2024.
//

import SwiftUI

struct AppView: View {
    private lazy var platform = Platform()
    
    var body: some View {
        Factory.home.makeHome()
    }
}

#Preview {
    AppView()
}
