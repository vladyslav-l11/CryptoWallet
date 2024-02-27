//
//  Platform.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Foundation

final class Platform: UseCaseProvider {
    let session: SessionUseCase
    
    init() {
        session = SessionService()
    }
}
