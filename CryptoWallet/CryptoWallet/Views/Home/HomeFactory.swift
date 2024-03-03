//
//  HomeFactory.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import Foundation

final class HomeFactory: RouterContainer {
    static let main = HomeFactory()
    var router = HomeRouter()
    private init() {}
    
    func makeHome() -> HomeView {
        HomeView(viewModel: HomeViewModel(router: router))
    }
    
    func makeSeed(useCases: UseCaseProvider, flow: SeedViewModel.Flow) -> SeedView {
        SeedView(viewModel: SeedViewModel(useCases: useCases, router: router, flow: flow))
    }
    
    func makeMain() -> MainView {
        MainView()
    }
}
