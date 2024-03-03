//
//  HomeRouter.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 18.02.2024.
//

import SwiftUI

final class HomeRouter: BaseRouter<HomeRouter>, Routeable {
    typealias Route = HomeRoute
    
    enum HomeRoute: Int, RouteBaseType {
        case signIn
        case signUp
        case main
        
        @ViewBuilder func getDestination(useCases: UseCaseProvider) -> some View {
            switch self {
            case .signIn:
                Factory.home.makeSeed(useCases: useCases, flow: .enterWithSeedPhrase)
            case .signUp:
                Factory.home.makeSeed(useCases: useCases, flow: .showSeedPhrase)
            case .main:
                Factory.home.makeMain()
            }
        }
    }
}
