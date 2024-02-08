//
//  ProductModel.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 08/02/24.
//

import Foundation
import SwiftUI


enum ProductCategory:CaseIterable, Hashable{
    case Sweets, Noodles, Chips, Choco
    
    var stringValue: String {
            switch self {
                case .Sweets: return "Sweets"
                case .Noodles: return "Noodles"
                case .Chips: return "Chips"
                case .Choco: return "Choco"
            }
        }
}

var productCategoryList = ["All","Sweets", "Noodles", "Chips", "Choco"]

struct ProductModel:Identifiable, Hashable {
    
    let id = UUID()
    let name:String
    let price:Float
    let bgColor:Color
    let category: ProductCategory
}

var productList = [ ProductModel(name: "Good Sauce", price: 12.99, bgColor: .blue, category: .Sweets),
                    ProductModel(name: "Nestle Maggi", price: 12.99, bgColor: .orange, category: .Noodles),
                    ProductModel(name: "Bingo Doritos", price: 12.99, bgColor: .green, category: .Chips),
                    ProductModel(name: "Dairy Milk", price: 12.99, bgColor: .purple, category: .Choco),
                    ProductModel(name: "Fritolay Kurkure", price: 12.99, bgColor: .pink, category: .Chips)
]
