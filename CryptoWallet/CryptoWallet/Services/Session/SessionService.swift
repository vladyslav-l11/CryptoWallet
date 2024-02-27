//
//  SessionService.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Combine
import Web3Core
import Foundation

final class SessionService: SessionUseCase {
    func createSeedPhrase() -> AsyncTask<[String]> {
        Future<[String], AppError> { promise in
            do {
                let mnemonicsString = try BIP39.generateMnemonics(entropy: 128)
                promise(.success(mnemonicsString))
            } catch {
                promise(.failure(AppError.web3(error: error)))
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
