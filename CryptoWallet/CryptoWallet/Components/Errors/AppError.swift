//
//  AppError.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Web3Core
import Foundation

enum AppError: Error {
    case web3(error: Web3Error)
    case undefined
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .web3(let error):
            return error.errorDescription
        default:
            return nil
        }
    }
}
