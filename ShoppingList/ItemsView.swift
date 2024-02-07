//
//  ItemsView.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import SwiftUI

struct ItemsView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Items")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Item", systemImage: "plus") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ItemsView()
}
