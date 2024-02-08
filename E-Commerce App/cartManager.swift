//
//  cartManager.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 10/02/24.
//

import Foundation
import SwiftUI

var cartItems:[ProductModel] = [  ProductModel(name: "Nestle Maggi", price: 9, bgColor: .yellow, category: .Noodles, image: "Maggi"),ProductModel(name: "Bingo Doritos", price: 11, bgColor: .purple, category: .Chips, image: "Doritos"),]
var totalItemsPresent:Int{
    return cartItems.count
}
func calculateTotalAmount(cartItems: [ProductModel]) -> Int {
    var total: Int = 0
    for item in cartItems {
        total += Int(item.price)
    }
    return total
}

