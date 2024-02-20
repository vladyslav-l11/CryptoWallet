//
//  SignUpView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 08.02.2024.
//

import SwiftUI

struct SeedView: View, ViewModelContainer {
    typealias ViewModel = SeedViewModel
    
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
    
    @ObservedObject private var viewModel: SeedViewModel
    @State private var flow: Flow
    private var columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    private var titleText: some View {
        Text(flow.title)
            .font(.title)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
    }
    
    private var seedWordsGrid: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(viewModel.originalWords.enumerated()), id: \.element) { index, _ in
                SeedWordView(rowNumber: $viewModel.words[index].number,
                             word: $viewModel.words[index].word,
                             isEnabled: !flow.isReadOnly)
            }
        }
    }
    
    private var performButton: some View {
        Button(action: {
            switch flow {
            case .showSeedPhrase:
                flow = .confirmSeedPhrase
            case .confirmSeedPhrase:
                viewModel.confirmSeedPhrase()
            case .enterWithSeedPhrase:
                viewModel.signIn()
            }
        }, label: {
            Text(flow.buttonTitle)
                .foregroundStyle(.white)
                .padding(.horizontal)
        })
        .frame(height: 48)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.top, 32)
    }
    
    init(viewModel: SeedViewModel, flow: Flow) {
        self.viewModel = viewModel
        self.flow = flow
    }
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                ScrollView {
                    titleText
                    seedWordsGrid
                    performButton
                }
                .padding(.horizontal)
            }
            .fullScreened()
            .frame(alignment: .top)
            .padding(.top, 96)
            .background(.white)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SeedView(viewModel: SeedViewModel(), flow: .enterWithSeedPhrase)
}
