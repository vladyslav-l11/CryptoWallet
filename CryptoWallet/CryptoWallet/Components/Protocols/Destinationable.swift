//
//  Destinationable.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 18.02.2024.
//

import SwiftUI

protocol Destinationable {
    associatedtype Destination: View
    func getDestination(useCases: UseCaseProvider) -> Destination
}
