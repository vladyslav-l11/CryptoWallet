//
//  SessionUseCase.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Foundation

protocol SessionUseCase {
    func createSeedPhrase() -> AsyncTask<[String]>
}
