//
//  EditStoreView.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import SwiftData
import SwiftUI

struct EditStoreView: View {
    
    @Bindable var store: Stores
    
    var body: some View {
        Form {
            TextField("Store Name", text: $store.storeName)
            TextField("Description", text: $store.storeDescription)
            TextField("Store Location", text: $store.address)
            Toggle("Favorite", isOn: $store.isFavorite)
        }
        .navigationTitle("Edit Store")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    do {
        let config: ModelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer: ModelContainer = try ModelContainer(for: Stores.self, configurations: config)
        
        let store: Stores = Stores(storeName: "Sample", storeDescription: "something", address: "San Antonio")
        
        return EditStoreView(store: store)
            .modelContainer(modelContainer)
    } catch {
        return Text("Error: \(error.localizedDescription)")
    }
    
    
}
