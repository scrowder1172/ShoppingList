//
//  StoresView.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import SwiftData
import SwiftUI

struct StoresView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var stores: [Stores]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(stores, id: \.self) { store in
                    Text(store.storeName)
                }
                .onDelete(perform: deleteStore)
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
    
    func deleteStore(for offsets: IndexSet) {
        for offset in offsets {
            let store: Stores = stores[offset]
            modelContext.delete(store)
        }
    }
}

#Preview {
    StoresView()
        .modelContainer(for: Stores.self)
}
