//
//  BaseRouter.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 17.02.2024.
//

import SwiftUI

class BaseRouter<T: Routeable> {
    @Environment(\.presentationMode) private var presentationMode
    @State private var route: T.Route?
    
    var links: some View {
        ForEach(Array(T.Route.allCases), id: \.self) { route in
            RouteNavigationLink<T, T.Route.Destination>(selection: self.$route, destination: route.desination, tag: route)
        }
    }
    
    func navigateTo(_ route: T.Route) {
        self.route = route
    }
    
    func navigateBack() {
        presentationMode.wrappedValue.dismiss()
    }
}
