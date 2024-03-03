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
    
    private init() {
        session = SessionService()
    }
}
