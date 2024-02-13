//
//  ProductTileView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 21/02/24.
//

import SwiftUI

struct ProductTileView: View {
    @Environment(\.dismiss) private var dismiss
    @State var product:ProductModel
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            VStack {
                HStack(spacing:40){
                    Text(product.name).bold()
                        .font(.system(size: 40)).padding()
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
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
                ScrollView{
                    ScrollView(.horizontal){
                        VStack{
                            Image(product.image).resizable().scaledToFit()
                                .frame(height: 250).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Ellipse().fill(.black.opacity(0.2)).frame(width: 200,height: 10)
                                .blur(radius: 1)
                        }.ignoresSafeArea().offset(x:100)
                    }
                    Divider().padding()
                    HStack{
                        Text(product.name).font(.system(size: 36)).bold()
                            Spacer()
                        Text("$**\(Int(product.price))**")
                            .font(.system(size: 46))
                    }.padding()
                    
                    HStack{
                        Text("Description").font(.system(size: 26)).fontWeight(.semibold)
                            .padding()
                        Spacer()
                    }
                        
                    Text(product.description)
                        .font(.system(size: 18))
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black.opacity(0.7))
                    
                    HStack{
                        Text("Delivery").font(.system(size: 20)).fontWeight(.semibold)
                        Image(systemName:"truck.box")
                        Spacer()
                        Text("Deliver in 4-5 days")
                    }.padding()
                   
                }
                Group{
                    Rectangle().frame(height: 100)
                        .overlay(
                            HStack{
                                Image(systemName:"cart")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .frame(width: 100,height: 40)
                                    .padding()
                                    .background(.white)
                                    .clipShape(.rect(cornerRadius: 20))
                                Text("Buy").font(.title)
                                    .frame(width: 100,height: 40)
                                    .padding()
                                    .background(.yellow)
                                    .clipShape(.rect(cornerRadius: 20))
                            }.fontDesign(.rounded)
                        )
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ProductTileView(product: productList[0])
}
