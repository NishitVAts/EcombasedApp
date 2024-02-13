//
//  cartManager.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 10/02/24.
//

import Foundation
import SwiftUI

var cartItems:[ProductModel] = []

var totalItemsPresent:Int{
    return cartItems.count
}


func TotalItemAmount(item: ProductModel) -> Int {
    var total: Int = 0
    total += Int(item.price) * item.quantity
    return total
}



func calculateTotalAmount(cartItems: [ProductModel]) -> Int {
    var amount: Int = 0
    for item in cartItems {
        amount += TotalItemAmount(item: item)
    }
    return amount
}

