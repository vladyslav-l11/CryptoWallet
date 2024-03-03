//
//  SeedFactory.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 03.03.2024.
//

import Foundation

final class SeedFactory {
    static let main = SeedFactory()
    private init() {}
    
    func makeSeed(useCases: UseCaseProvider, flow: SeedViewModel.Flow) -> SeedView {
        SeedView(viewModel: SeedViewModel(useCases: useCases, flow: flow))
    }
}
