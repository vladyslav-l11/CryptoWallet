//
//  View+Extensions.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 20.02.2024.
//

import SwiftUI

// MARK: - Size
extension View {
    func fullScreened() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func enabled(_ isEnabled: Bool) -> some View {
        opacity(isEnabled ? 1 : 0.5)
            .disabled(!isEnabled)
    }
}

// MARK: - TextField
extension View where Self == TextField<EmptyView> {
    func placeholder(_ text: LocalizedStringKey, shouldShow: Bool, alignment: Alignment = .leading, color: Color = .gray) -> some View {
        ZStack(alignment: alignment) {
            Text(text).opacity(shouldShow ? 1 : 0).foregroundColor(color)
            self
        }
    }
    
    init(text: Binding<String>) {
        self.init(text: text, label: {})
    }
}
