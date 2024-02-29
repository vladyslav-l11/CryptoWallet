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
    
    func enterAccount(_ mnemonics: [String]) -> AsyncTask<Wallet> {
        Future<Wallet, AppError> { promise in
            do {
                let mnemonicsString = mnemonics.joined(separator: " ")
                guard let keystore = try BIP32Keystore(mnemonics: mnemonicsString,
                                                       password: "",
                                                       mnemonicsPassword: "",
                                                       language: .english) else {
                    throw Web3Error.keystoreError(err: .invalidPasswordError)
                }
                guard let address = keystore.addresses?.first?.address else {
                    throw Web3Error.keystoreError(err: .aesError)
                }
                let keyData = try JSONEncoder().encode(keystore.keystoreParams)
                let wallet = Wallet(address: address, data: keyData, name: "wallet", mnemonics: mnemonics)
                promise(.success(wallet))
            } catch {
                promise(.failure(AppError.web3(error: error)))
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
