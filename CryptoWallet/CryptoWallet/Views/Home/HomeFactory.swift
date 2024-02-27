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
    
    func makeHome() -> HomeView {
        HomeView(viewModel: HomeViewModel())
    }
    
    func makeSeed(useCases: UseCaseProvider, flow: SeedView.Flow) -> SeedView {
        SeedView(viewModel: SeedViewModel(useCases: useCases), flow: flow)
    }
}
