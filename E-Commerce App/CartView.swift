//
//  CartView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 14/02/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            HStack(spacing:40){
                Text("Cart").bold()
                    .font(.system(size: 40)).padding()
                Image(systemName:"cart")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70, height: 90)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50).fill(.yellow).opacity(0.4)
                    )
                Image(systemName:"arrow.turn.down.left")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70, height: 90)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4)
                    )
                    .onTapGesture {
                        dismiss()
                    }
                
            }.padding()
            List{
                ForEach(cartItems){ items in
                    cartRowView(product: items)
                }
            }.listStyle(.plain)
        }
    }
}

struct cartRowView:View {
    @State var product:ProductModel
    var body: some View {
        HStack{
            Image(product.image).resizable().scaledToFit().padding().background(.white)
            VStack(alignment: .leading){
                Text(product.name)
                Text("$\(Int(product.price))")
            }.font(.headline)
            Image(systemName: "minus.circle.fill").onTapGesture {
                product.quantity -= 1
            }
            Text("\(product.quantity)")
            Image(systemName: "plus.circle.fill").onTapGesture {
                product.quantity += 1
            }
        }.frame(width:UIScreen.main.bounds.width ,height: 70).padding()
            .background(.yellow.opacity(0.6))
    }
}

#Preview {
    CartView()
}
