//
//  BaseRouter.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 17.02.2024.
//

import SwiftUI

class BaseRouter<T: Routeable>: ObservableObject {
    @Environment(\.presentationMode) private var presentationMode
    @Published var route: T.Route?
    
    func navigateTo(_ route: T.Route) {
        self.route = route
    }
    
    func navigateBack() {
        presentationMode.wrappedValue.dismiss()
    }
}
