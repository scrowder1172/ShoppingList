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
    
    @Query(sort: \Stores.storeName) var stores: [Stores]
    
    @State private var isShowingAddStore: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Favorites") {
                    ForEach(stores) { store in
                        if store.isFavorite {
                            NavigationLink {
                                EditStoreView(store: store)
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(store.storeName)
                                            .font(.headline)
                                        if store.address.isEmpty == false {
                                            Text(store.address)
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    Spacer()
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(.yellow)
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button("Favorite", systemImage: "star.slash") {
                                    store.isFavorite.toggle()
                                }
                                .tint(.yellow)
                            }
                        }
                    }
                    .onDelete(perform: deleteStore)
                }
                
                Section("Other") {
                    ForEach(stores) { store in
                        if store.isFavorite == false {
                            NavigationLink {
                                EditStoreView(store: store)
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(store.storeName)
                                            .font(.headline)
                                        if store.address.isEmpty == false {
                                            Text(store.address)
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            .swipeActions(edge: .leading) {
                                Button("Favorite", systemImage: "star") {
                                    store.isFavorite.toggle()
                                }
                                .tint(.yellow)
                            }
                        }
                    }
                    .onDelete(perform: deleteStore)
                }
                
            }
            .navigationTitle("Stores")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Store", systemImage: "plus") {
                        isShowingAddStore = true
                    }
                }
            }
            .sheet(isPresented: $isShowingAddStore) {
                AddStoreView()
            }
            .overlay {
                if stores.isEmpty {
                    ContentUnavailableView(
                        label: {
                            Label("No Stores", systemImage: "storefront.circle")
                        }
                        , description: {
                            Text("Start adding stores to your list.")
                        }, actions: {
                            Button("Add Store") {
                                isShowingAddStore = true
                            }
                        })
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
