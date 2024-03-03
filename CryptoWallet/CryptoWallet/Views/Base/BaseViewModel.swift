//
//  BaseViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 27.02.2024.
//

import Combine

class BaseViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    
    deinit {
        cancellable.cancellAll()
    }
}
