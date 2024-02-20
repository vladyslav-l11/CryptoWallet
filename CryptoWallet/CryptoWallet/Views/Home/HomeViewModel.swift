//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import SwiftUI

final class HomeViewModel: RouterContainer, ObservableObject {
    var router: HomeRouter = HomeRouter()
    
    func didOpenSignIn() {
        router.navigateTo(.signIn)
    }
}
