//
//  SeedViewModel.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 14.02.2024.
//

import Combine
import SwiftUI

final class SeedViewModel: BaseViewModel, UseCasesConsumer {
    typealias UseCases = HasSessionUseCase
    
    enum Flow {
        case showSeedPhrase
        case confirmSeedPhrase
        case enterWithSeedPhrase
        
        var title: LocalizedStringKey {
            switch self {
            case .showSeedPhrase:
                return Localizable.saveSeedPhrase
            case .confirmSeedPhrase:
                return Localizable.confirmSeedPhrase
            case .enterWithSeedPhrase:
                return Localizable.enterSeedPhrase
            }
        }
        
        var isReadOnly: Bool {
            self == .showSeedPhrase
        }
        
        var buttonTitle: LocalizedStringKey {
            switch self {
            case .showSeedPhrase:
                return Localizable.saveSeedPhraseButton
            case .confirmSeedPhrase:
                return Localizable.confirmSeedPhraseButton
            case .enterWithSeedPhrase:
                return Localizable.enterSeedPhraseButton
            }
        }
    }
    
    // MARK: - Properties
    @Published var isValid = CurrentValueSubject<Bool, Never>(false)
    @Published var words: [SeedWord] = []
    @Published var flow: Flow
    var originalWords: [SeedWord] = []
    
    let useCases: UseCases
    
    // MARK: - Initialization
    init(useCases: UseCases, flow: Flow) {
        self.flow = flow
        self.useCases = useCases
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
        
        if flow == .showSeedPhrase {
            useCases.session.createSeedPhrase()
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { [weak self] in
                        $0.enumerated().forEach { index, word in
                            self?.words[index].word = word
                        }
                    }
                )
                .store(in: &cancellable)
        }
    }
    
    // MARK: - Actions
    func confirmSeedPhrase() {
        // TODO
    }
    
    func signIn() {
        // TODO
    }
    
    func switchToConfirm() {
        flow = .confirmSeedPhrase
        words.empty()
    }
}
