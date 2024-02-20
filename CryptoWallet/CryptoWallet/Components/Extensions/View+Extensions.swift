//
//  View+Extensions.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import SwiftUI

extension View {
    func fullScreened() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
