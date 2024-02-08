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
    @State private var isFavorite: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    TextField("Store", text: $storeName)
                        .textContentType(.organizationName)
                        .textInputAutocapitalization(.words)
                    Text("Required")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
                
                TextField("Description", text: $storeDescription, axis: .vertical)
                
                TextField("Address", text: $storeAddress)
                    .textContentType(.fullStreetAddress)
                
                Toggle("Favorite", isOn: $isFavorite)
            }
            .navigationTitle("Add Store")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addStore()
                        dismiss()
                    }
                }
            }
        }
    }
    
    func addStore() {
        guard storeName.isEmpty == false else { return }
        
        let store: Stores = Stores(storeName: storeName, storeDescription: storeDescription, address: storeAddress, isFavorite: isFavorite)
        modelContext.insert(store)
        
    }
}

#Preview {
    AddStoreView()
        .modelContainer(for: Stores.self)
}
