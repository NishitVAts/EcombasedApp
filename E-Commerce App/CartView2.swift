//
//  CartView2.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 14/02/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) private var dismiss
    @State var product:ProductModel = productList[0]
    var body: some View {
        VStack{
            HStack{
                Text("**Cart**").font(.system(size: 36))
                Spacer()
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
            
            cartItemsView(item: $product)
        }
    }
}

struct cartItemsView:View {
    @Binding var item:ProductModel
    var body: some View {
        GeometryReader { geo in
            HStack{
                Image(item.image).resizable().scaledToFit().padding().background(item.bgColor.opacity(0.8)).clipShape(Circle())
                
                VStack(alignment:.leading){
                    Text(item.name).font(.headline)
                    Text("$\(Int(item.price))")
                }.font(.headline).padding()
                
                Image(systemName:"minus.circle.fill").foregroundColor(.white).onTapGesture{ if(item.quantity != 0){item.quantity = item.quantity-1 }}
                Text("\(TotalItemAmount(item:item))")
                Image(systemName:"plus.circle.fill").foregroundColor(.white).onTapGesture{ item.quantity = item.quantity+1 }
                
                
                
            }.padding().frame(width: geo.size.width,height: geo.size.height*0.15).background(item.bgColor.opacity(0.4))
            
        }
    }
}

#Preview {
    CartView()
}
