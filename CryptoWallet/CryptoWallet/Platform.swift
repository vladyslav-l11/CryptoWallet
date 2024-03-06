//
//  Platform.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Foundation

final class Platform: UseCaseProvider {
    static let shared = Platform()
    
    let session: SessionUseCase
    let web3: Web3UseCase
    
    private init() {
        session = SessionService()
        web3 = Web3Service()
    }
}
