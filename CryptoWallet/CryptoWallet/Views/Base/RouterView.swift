//
//  RouterView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 17.02.2024.
//

import SwiftUI

struct RouterView<R: Routeable, Content: View>: View {
    typealias Router = BaseRouter<R>
    
    private var router: Router
    private let content: Content
    
    init(router: Router, @ViewBuilder content: @escaping () -> Content) {
        self.router = router
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            router.links
            content
        }
    }
}
