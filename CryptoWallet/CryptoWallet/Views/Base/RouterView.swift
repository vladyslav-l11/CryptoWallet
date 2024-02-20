//
//  RouterView.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 17.02.2024.
//

import SwiftUI

struct RouterView<R: Routeable, Content: View>: View {
    typealias Router = BaseRouter<R>
    
    @ObservedObject private var router: Router
    private let content: Content
    
    private var links: some View {
        ForEach(Array(R.Route.allCases), id: \.self) { route in
            RouteNavigationLink<R, R.Route.Destination>(selection: $router.route, destination: route.desination, tag: route)
        }
    }
    
    init(router: Router, @ViewBuilder content: @escaping () -> Content) {
        self.router = router
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                links
                content
            }
        }
    }
}
