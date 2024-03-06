//
//  UseCaseProvider.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Foundation

protocol HasSessionUseCase {
    var session: SessionUseCase { get }
}

protocol HasWeb3UseCase {
    var web3: Web3UseCase
}

typealias UseCases = HasSessionUseCase & HasWeb3UseCase

protocol UseCaseProvider: UseCases { }
