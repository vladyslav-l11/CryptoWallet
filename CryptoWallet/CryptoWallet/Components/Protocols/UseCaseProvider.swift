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

typealias UseCases = HasSessionUseCase

protocol UseCaseProvider: UseCases { }
