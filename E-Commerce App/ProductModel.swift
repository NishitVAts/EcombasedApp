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
    let image:String
    var quantity:Int
    
    init(name: String, price: Float, bgColor: Color, category: ProductCategory, image: String, quantity: Int) {
        self.name = name
        self.price = price
        self.bgColor = bgColor
        self.category = category
        self.image = image
        self.quantity = quantity
    }
}

var productList = [ ProductModel(name: "Cheetos", price: 9, bgColor: .red, category: .Chips, image: "Cheetos", quantity: 0),
                    ProductModel(name: "Nestle Maggi", price: 9, bgColor: .yellow, category: .Noodles, image: "Maggi", quantity: 0),
                    ProductModel(name: "Bingo Doritos", price: 11, bgColor: .purple, category: .Chips, image: "Doritos", quantity: 0),
                    ProductModel(name: "Dairy Milk", price: 8, bgColor: .blue, category: .Choco, image: "DairyMilk", quantity: 0),
                    ProductModel(name: "Fritolay Kurkure", price: 13, bgColor: .green, category: .Chips, image: "Kurkure", quantity: 0),
                    ProductModel(name: "Lays", price: 11, bgColor: .red, category: .Chips, image: "Lays", quantity: 0),
                    ProductModel(name: "Oreo", price: 12.99, bgColor: .blue, category: .Chips, image: "oreo", quantity: 0), ]
