//
//  UseCasesConsumer.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Foundation

protocol UseCasesConsumer: AnyObject {
    associatedtype UseCases
    
    var useCases: UseCases { get }
}
