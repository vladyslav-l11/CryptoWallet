//
//  ContentView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 05.02.2024.
//

import SwiftUI

struct AppView: View {
    let useCases: UseCaseProvider
    
    var body: some View {
        Factory.home.makeHome()
    }
}

#Preview {
    AppView(useCases: Platform())
}
