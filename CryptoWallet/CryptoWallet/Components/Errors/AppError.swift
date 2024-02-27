//
//  AppError.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Web3Core
import Foundation

enum AppError: Error {
    case web3(error: Error)
    case underlying(error: Error)
    case undefined
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .web3(let error):
            return error.errorDescription
        case .underlying(let error):
            return error.localizedDescription
        default:
            return nil
        }
    }
}
