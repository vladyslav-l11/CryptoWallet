//
//  Factory.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import Foundation

final class Factory {
    static let home = HomeFactory.main
    static let seed = SeedFactory.main
}
