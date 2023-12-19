//
//  CartManager.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 18.12.2023.
//

import Foundation

class CartManager {
    static let shared = CartManager()

    private var cartProducts: [Product] = []

    func addProductToCart(product: Product) {
        cartProducts.append(product)
    }

    func removeProductFromCart(at index: Int) {
        guard index >= 0, index < cartProducts.count else {
            return
        }
        cartProducts.remove(at: index)
    }

    func getCartProducts() -> [Product] {
        return cartProducts
    }
}
