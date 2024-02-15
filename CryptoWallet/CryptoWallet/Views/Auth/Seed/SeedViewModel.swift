//
//  SeedViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 14.02.2024.
//

import Combine

final class SeedViewModel: ObservableObject {
    @Published var words: [SeedWord] = []
    
    init() {
        (1...12).forEach { words.append(SeedWord(number: $0)) }
    }
    
    func confirmSeedPhrase() {
        // TODO
    }
}
