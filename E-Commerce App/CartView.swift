//
//  CartView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 09/02/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("**Cart**")
                        .font(.system(size: 32))
                    Spacer()
                    Text("\(totalItemsPresent)").font(.title)
                        .imageScale(.large)
                        .padding()
                        .frame(width: 70, height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50).fill(.yellow).opacity(0.4)
                        )
                    
                    NavigationLink {
                        ContentView()
                    } label: {
                        Image(systemName:"arrow.turn.down.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4)
                            ).foregroundColor(.black)
                            .onTapGesture{ dismiss()}
                            .padding(.trailing,-15)
                    }
                    
                    
                }.padding()
                ScrollView{
                    ForEach(cartItems, id: \.id){ item in
                        cartCardView(product: item)
                    }
                    VStack(alignment:.leading){
                        HStack{
                            Text("Delivery Fee")
                            Spacer()
                            Text("Free")
                        }
                        Divider()
                        Text("Total Amount").font(.system(size: 24))
                        HStack{
                            Text("USD \(calculateTotalAmount(cartItems:cartItems))").font(.system(size: 36)).bold()
                            Spacer()
                            Image(systemName:"bag").imageScale(.large).padding()
                                .foregroundColor(.white)
                                .background(.black)
                                .clipShape(.circle)
                        }
                        
                    }.padding(30)
                        .background(.yellow.opacity(0.4))
                        .clipShape(.rect(cornerRadius: 30))
                        .padding()
                    
                }
                
            }.padding()
        }.padding()
        .navigationBarBackButtonHidden()
        
    }
}

struct cartCardView:View {
    @State var product:ProductModel
    var body: some View {
        HStack(spacing:30){
            Image(product.image).resizable().scaledToFit().padding()
                .background(product.bgColor.opacity(0.6)).clipShape(Circle())
                .frame(width: 50)
            VStack(alignment:.leading){
                Text(product.name).bold()
                Text(product.category.stringValue).foregroundColor(.gray)
            }.padding()
            Spacer()
            Text("$\(Int(product.price))").padding().background(.white)
                .clipShape(Circle())
        }.frame(width: UIScreen.main.bounds.width*0.9, height: 60)
            .padding()
            .fontDesign(.rounded)
    }
}

#Preview {
    CartView()
}
