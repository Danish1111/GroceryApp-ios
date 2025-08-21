//
//  WishCardManager.swift
//  General Grocery Store
//
//  Created by Absolute on 31/07/25.
//

import SwiftUI

class WishCardManager {
    static let shared = WishCardManager()
    private let key = "wishcardProducts"

    func getProducts() -> [Product] {
        if let data = UserDefaults.standard.data(forKey: key),
           let products = try? JSONDecoder().decode([Product].self, from: data) {
            return products
        }
        return []
    }

    func addProduct(_ product: Product) {
        var current = getProducts()
        current.append(product)
        if let data = try? JSONEncoder().encode(current) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func clearWishCard() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
