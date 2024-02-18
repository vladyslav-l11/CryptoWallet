//
//  Routeable.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 17.02.2024.
//

import Foundation

protocol Routeable {
    associatedtype Route: RawRepresentable & Hashable & CaseIterable & Destinationable where Route.RawValue == Int
}
