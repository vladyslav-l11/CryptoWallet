//
//  MainViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 04.03.2024.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    enum Tokens: CaseIterable {
        case eth
        case uni
        case oneInch
        
        var title: LocalizedStringKey {
            switch self {
            case .eth:
                return Localizable.mainEth
            case .uni:
                return Localizable.mainUni
            case .oneInch:
                return Localizable.mainOneInch
            }
        }
        
        var image: UIImage {
            switch self {
            case .eth:
                return R.image.icETH()!
            case .uni:
                return R.image.icUNI()!
            case .oneInch:
                return R.image.icOneInch()!
            }
        }
    }
}
