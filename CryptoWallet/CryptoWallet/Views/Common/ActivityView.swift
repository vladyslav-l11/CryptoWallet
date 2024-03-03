//
//  ActivityView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 29.02.2024.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        GeometryReader { _ in
            ZStack {
                Color.white
                    .opacity(0.5)
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.black)
            }
            .edgesIgnoringSafeArea(.all)
            .disabled(true)
        }
    }
}

#Preview {
    ActivityView()
}
