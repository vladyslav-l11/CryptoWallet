//
//  RouteNavigationLink.swift
//  CryptoWallet
//
//  Created by Vladyslav Lysenko on 18.02.2024.
//

import SwiftUI

struct RouteNavigationLink<T: Routeable, Destination: View>: View {
    @Binding var selection: T.Route?
    var destination: Destination
    var tag: T.Route
    
    var body: some View {
        NavigationLink(destination: destination, tag: tag, selection: $selection) { EmptyView() }
    }
}
