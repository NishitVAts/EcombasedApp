//
//  ProductTileView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 10/02/24.
//

import SwiftUI

struct ProductTileView: View {
    @Environment(\.dismiss) private var dismiss
    @State var product:ProductModel
    var body: some View {
        ZStack{
            VStack{
                HStack(spacing:40){
                    Text(product.name).bold()
                        .font(.system(size: 36))
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
                ScrollView(.horizontal, showsIndicators:false){
                    Image(product.image).resizable().scaledToFit()
                        .frame(height: 350) .offset(x:70)
                }.padding()
                HStack{
                    Button(action: {}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40).rotation(.degrees(40)).fill(.black)
                            Image(systemName:"minus").font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 100, height: 100)
                        } .frame(width: 100, height:100)
                            .offset(x:-100)
                    })
                    Text("02").font(.system(size: 40)).bold()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 40).rotation(.degrees(40)).fill(.black)
                            Image(systemName:"plus").font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 100, height: 100)
                        } .frame(width: 100, height:100)
                            .offset(x:100)
                    })
                }
                HStack{
                    Text("$ **\(Int(product.price))**").font(.system(size: 36)).padding(.horizontal,30)
                        Spacer()
                    Text("Go to cart").font(.system(size: 24)).bold().padding().frame(width: 230,height: 100)
                        .background(.yellow.opacity(0.6))
                        
                        .clipShape(.rect(cornerRadius: 30))
                        
                }.padding()
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    ProductTileView(product: productList[0])
}
