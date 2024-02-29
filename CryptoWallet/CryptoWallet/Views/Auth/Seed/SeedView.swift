//
//  SignUpView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 08.02.2024.
//

import SwiftUI

struct SeedView: View, ViewModelContainer {
    typealias ViewModel = SeedViewModel
    
    @ObservedObject private var viewModel: SeedViewModel
    private var columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    private var titleText: some View {
        Text(viewModel.flow.title)
            .font(.title)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
    }
    
    private var seedWordsGrid: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.originalWords.indices, id: \.self) { index in
                SeedWordView(rowNumber: $viewModel.words[index].number,
                             word: $viewModel.words[index].word,
                             isEnabled: !viewModel.flow.isReadOnly)
            }
        }
    }
    
    private var performButton: some View {
        Button(action: {
            switch viewModel.flow {
            case .showSeedPhrase:
                viewModel.switchToConfirm()
            case .confirmSeedPhrase:
                viewModel.confirmSeedPhrase()
            case .enterWithSeedPhrase:
                viewModel.signIn()
            }
        }, label: {
            Text(viewModel.flow.buttonTitle)
                .foregroundStyle(.white)
                .padding(.horizontal)
        })
        .frame(height: 48)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.top, 32)
        .enabled(viewModel.isValid.value)
    }
    
    init(viewModel: SeedViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { _ in
            ZStack {
                ScrollView {
                    titleText
                    seedWordsGrid
                    performButton
                }
                .padding(.horizontal)
                
                ActivityView()
                    .hidden(!viewModel.isLoading)
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
    SeedView(viewModel: SeedViewModel(useCases: Platform.shared, flow: .enterWithSeedPhrase))
}
