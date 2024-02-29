//
//  AnyCancellable+Extension.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 29.02.2024.
//

import Combine

extension Set where Element == AnyCancellable {
    mutating func cancellAll() {
        forEach { $0.cancel() }
        removeAll()
    }
}
