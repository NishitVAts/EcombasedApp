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

var productCategoryList = ["All","Sweets","Noodles", "Chips", "Choco"]

struct ProductModel:Identifiable, Hashable {
    
    let id = UUID()
    let name:String
    let price:Float
    let bgColor:Color
    let category: ProductCategory
    let image:String
    var quantity:Int
    var description:String
    
    init(name: String, price: Float, bgColor: Color, category: ProductCategory, image: String, quantity: Int, description: String) {
        self.name = name
        self.price = price
        self.bgColor = bgColor
        self.category = category
        self.image = image
        self.quantity = quantity
        self.description = description
    }
}

func categorisedList( `var` filter:String ) -> [ProductModel] {
    var categorisedList = [ProductModel]()
    if filter == "All"{
        return productList
    }
    else{
        for item in productList {
            if item.category.stringValue == filter{
                categorisedList.append(item)
            }
        }
    }
    return categorisedList
}

var productList = [
    ProductModel(name: "Cheetos", price: 9, bgColor: .red, category: .Chips, image: "Cheetos", quantity: 0, description: "Making its U.S. debut this fall, Cheetos® Bolitas™ pack a powerful chili and cheese punch into bite-sized balls with a uniquely soft, crunchy texture that was only available in Mexico – until now."),
    ProductModel(name: "Nestle Maggi", price: 9, bgColor: .yellow, category: .Noodles, image: "Maggi", quantity: 0, description: "Instant noodle brand"),
    ProductModel(name: "Bingo Doritos", price: 11, bgColor: .purple, category: .Chips, image: "Doritos", quantity: 0, description: "Tortilla chips with various flavors"),
    ProductModel(name: "Dairy Milk", price: 8, bgColor: .blue, category: .Choco, image: "DairyMilk", quantity: 0, description: "Classic milk chocolate bar"),
    ProductModel(name: "Fritolay Kurkure", price: 13, bgColor: .green, category: .Chips, image: "Kurkure", quantity: 0, description: "Indian crunchy snack"),
    ProductModel(name: "Lays", price: 11, bgColor: .red, category: .Chips, image: "Lays", quantity: 0, description: "Potato chips with various flavors"),
    ProductModel(name: "Oreo", price: 12.99, bgColor: .blue, category: .Chips, image: "oreo", quantity: 0, description: "Chocolate sandwich cookies"),
    ProductModel(name: "Snickers", price: 10, bgColor: .brown, category: .Choco, image: "Snickers", quantity: 0, description: "Peanut and caramel chocolate bar"),
    ProductModel(name: "KitKat", price: 8, bgColor: .blue, category: .Choco, image: "KitKat", quantity: 0, description: "Wafer chocolate bar"),
    ProductModel(name: "Twix", price: 9, bgColor: .brown, category: .Choco, image: "Twix", quantity: 0, description: "Chocolate biscuit bar"),
    ProductModel(name: "M&M's", price: 7, bgColor: .yellow, category: .Choco, image: "MnMs", quantity: 0, description: "Colorful button-shaped chocolates"),
    ProductModel(name: "Ramen", price: 5, bgColor: .yellow, category: .Noodles, image: "Ramen", quantity: 0, description: "Japanese noodle soup dish"),
    ProductModel(name: "Soba", price: 6, bgColor: .white, category: .Noodles, image: "Soba", quantity: 0, description: "Thin buckwheat noodles"),
    ProductModel(name: "Udon", price: 6, bgColor: .white, category: .Noodles, image: "Udon", quantity: 0, description: "Thick wheat flour noodles"),
    ProductModel(name: "Pocky", price: 3, bgColor: .pink, category: .Sweets, image: "Pocky", quantity: 0, description: "Biscuit sticks dipped in chocolate"),
    ProductModel(name: "Gummy Bears", price: 4, bgColor: .green, category: .Sweets, image: "GummyBears", quantity: 0, description: "Chewy gelatin-based candies"),
    ProductModel(name: "Lindt Lindor", price: 15, bgColor: .yellow, category: .Choco, image: "LindtLindor", quantity: 0, description: "Smooth melting chocolate truffles"),
    ProductModel(name: "Hershey's Kisses", price: 6, bgColor: .gray, category: .Choco, image: "HersheysKisses", quantity: 0, description: "Small bite-sized chocolates"),
    ProductModel(name: "Pringles", price: 10, bgColor: .yellow, category: .Chips, image: "Pringles", quantity: 0, description: "Stackable potato chips"),
    ProductModel(name: "Doritos Cool Ranch", price: 12, bgColor: .blue, category: .Chips, image: "DoritosCoolRanch", quantity: 0, description: "Ranch-flavored corn chips"),
    ProductModel(name: "Ruffles", price: 11, bgColor: .orange, category: .Chips, image: "Ruffles", quantity: 0, description: "Ridged potato chips"),
    ProductModel(name: "Toblerone", price: 8, bgColor: .brown, category: .Choco, image: "Toblerone", quantity: 0, description: "Swiss chocolate bar with nougat and almonds")
]
