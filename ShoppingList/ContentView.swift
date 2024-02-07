//
//  ContentView.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StoresView()
                .tabItem {
                    Label("Stores", systemImage: "storefront.circle")
                }
            
            ItemsView()
                .tabItem {
                    Label("Items", systemImage: "fork.knife.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
