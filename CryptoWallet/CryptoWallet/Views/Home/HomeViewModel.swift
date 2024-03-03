//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import SwiftUI

final class HomeViewModel: RouterContainer, ObservableObject {
    weak var router: HomeRouter?
    
    init(router: HomeRouter) {
        self.router = router
    }
    
    func didOpenSignIn() {
        router?.navigateTo(.signIn)
    }
    
    func didOpenSignUp() {
        router?.navigateTo(.signUp)
    }
}
