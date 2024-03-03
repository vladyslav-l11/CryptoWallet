//
//  SeedWord.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 14.02.2024.
//

import Foundation

struct SeedWord: Hashable {
    var number: Int
    var word: String = ""
}

extension Array where Element == SeedWord {
    mutating func empty() {
        indices.forEach {
            self[$0].word = ""
        }
    }
}
