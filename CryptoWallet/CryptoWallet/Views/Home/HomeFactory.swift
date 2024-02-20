//
//  HomeFactory.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import Foundation

final class HomeFactory {
    static let main = HomeFactory()
    private init() {}
    
    func makeSeed(flow: SeedView.Flow) -> SeedView {
        SeedView(viewModel: SeedViewModel(), flow: flow)
    }
}
