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
        
        var title: LocalizedStringKey {
            switch self {
            case .showSeedPhrase:
                return Localizable.saveSeedPhrase
            case .confirmSeedPhrase:
                return Localizable.confirmSeedPhrase
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
            }
        }
    }
    
    @ObservedObject private var viewModel: SeedViewModel
    @State private var flow: Flow = .showSeedPhrase
    private var columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    private var titleText: Text {
        Text(flow.title)
            .font(.title)
    }
    
    private var seedWordsGrid: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(viewModel.words.enumerated()), id: \.element) { index, _ in
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
    
    init(viewModel: SeedViewModel, flow: Flow = .showSeedPhrase) {
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
            .frame(maxHeight: .infinity,
                   alignment: .top)
        }
    }
}

#Preview {
    SeedView(viewModel: SeedViewModel())
}
