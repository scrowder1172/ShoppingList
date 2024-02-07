//
//  Stores.swift
//  ShoppingList
//
//  Created by SCOTT CROWDER on 2/7/24.
//

import Foundation
import SwiftData

@Model
final class Stores {
    var id: UUID
    var storeName: String
    var storeDescription: String
    var address: String
    var dateAdded: Date
    var dateLastUpdate: Date
    
    init(storeName: String, storeDescription: String, address: String) {
        self.id = UUID()
        self.storeName = storeName
        self.storeDescription = storeDescription
        self.address = address
        self.dateAdded = Date()
        self.dateLastUpdate = Date()
    }
}
