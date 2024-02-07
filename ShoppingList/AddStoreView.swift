//
//  AddStoreView.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import SwiftData
import SwiftUI

struct AddStoreView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var storeName: String = ""
    @State private var storeDescription: String = ""
    @State private var storeAddress: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    TextField("Store", text: $storeName)
                    Text("Required")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
                
                TextField("Description", text: $storeDescription, axis: .vertical)
                
                TextField("Address", text: $storeAddress)
                
                Button("Save") {
                    addStore()
                }
            }
            .navigationTitle("Add Store")
        }
    }
    
    func addStore() {
        guard storeName.isEmpty == false else { return }
        
        let store: Stores = Stores(storeName: storeName, storeDescription: storeDescription, address: storeAddress)
        modelContext.insert(store)
        
        dismiss()
        
    }
}

#Preview {
    AddStoreView()
}
