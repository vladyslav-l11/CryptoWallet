//
//  Routeable.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 17.02.2024.
//

import Foundation

typealias RouteBaseType = RawRepresentable & Hashable & CaseIterable & Destinationable

protocol Routeable {
    associatedtype Route: RouteBaseType where Route.RawValue == Int
}
