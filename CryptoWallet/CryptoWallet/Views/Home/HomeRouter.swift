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
        
        var desination: some View {
            switch self {
            case .signIn:
                return Factory.home.makeSeed(flow: .enterWithSeedPhrase)
            case .signUp:
                return Factory.home.makeSeed(flow: .showSeedPhrase)
            }
        }
    }
}
