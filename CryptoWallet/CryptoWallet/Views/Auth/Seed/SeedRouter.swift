//
//  SeedRouter.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 03.03.2024.
//

import SwiftUI

final class SeedRouter: BaseRouter<SeedRouter>, Routeable {
    typealias Route = SeedRoute
    
    enum SeedRoute: Int, RouteBaseType {
        case main
        
        func getDestination(useCases: UseCaseProvider) -> some View {
            switch self {
            case .main:
                return Factory.seed.makeMain()
            }
        }
    }
}
