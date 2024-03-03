//
//  RouterContainer.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import Foundation

protocol RouterContainer {
    associatedtype Router
    
    var router: Router { get }
}
