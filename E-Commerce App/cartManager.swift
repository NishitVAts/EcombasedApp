//
//  cartManager.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 10/02/24.
//

import Foundation
import SwiftUI

var cartItems:[ProductModel] = [  ProductModel(name: "Nestle Maggi", price: 9, bgColor: .yellow, category: .Noodles, image: "Maggi", quantity: 1),ProductModel(name: "Bingo Doritos", price: 11, bgColor: .purple, category: .Chips, image: "Doritos", quantity: 1),]

var totalItemsPresent:Int{
    return cartItems.count
}


func TotalItemAmount(item: ProductModel) -> Int {
    var total: Int = 0
    total += Int(item.price) * item.quantity
    return total
}



func calculateTotalAmount(cartItems: [ProductModel]) -> Int {
    var total: Int = 0
    for item in cartItems {
        total += Int(item.price) * item.quantity
    }
    return total
}

