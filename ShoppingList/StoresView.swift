//
//  StoresView.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import SwiftUI

struct StoresView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Stores")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Store", systemImage: "plus") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    StoresView()
}
