//
//  SeedViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 14.02.2024.
//

import Combine

final class SeedViewModel: BaseViewModel {
    // MARK: - Properties
    @Published var isValid = CurrentValueSubject<Bool, Never>(false)
    @Published var words: [SeedWord] = []
    var originalWords: [SeedWord] = []
    
    // MARK: - Initialization
    override init() {
        super.init()
        (1...12).forEach { words.append(SeedWord(number: $0)) }
        originalWords = words
        binding()
    }
    
    // MARK: - Binding
    private func binding() {
        $words
            .sink { [weak self] in
                self?.isValid.send($0.map(\.word).allSatisfy({ !$0.isEmpty }))
            }
            .store(in: &cancellable)
    }
    
    // MARK: - Actions
    func confirmSeedPhrase() {
        // TODO
    }
    
    func signIn() {
        // TODO
    }
}
