//
//  ProductCollectionView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 09/02/24.
//

import SwiftUI

struct ProductCollectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State var filterCollection:String = "Chips"
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("**\(filterCollection)** Collection")
                        .font(.system(size: 32))
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
                        
                }.padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(categorisedList(var: filterCollection), id: \.id){
                            item in
                            NavigationLink {
                                ProductTileView(product: item)
                            } label: {
                                collectionCardView(product: item)
                            }.foregroundColor(.black)
                        }
                    })
                }
                
            }.navigationBarBackButtonHidden()
        }
    }
}

struct collectionCardView:View {
    @State var product:ProductModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0).fill(product.bgColor.opacity(0.2)).frame(width: 180, height: 220)
                .overlay(
                    
                    ZStack {
                        Image(product.image).resizable().scaledToFit()
                            .frame(width: 80)
                            .offset(y:0)
                        VStack(alignment: .leading){
                            Text(product.name).font(.system(size: 20)).bold()
                                .frame(width: 80)
                            Text(product.category.stringValue).font(.system(size: 10))
                                .padding()
                                .background(.ultraThickMaterial)
                                .clipShape(.capsule)
                        Spacer()
                            RoundedRectangle(cornerRadius: 35.0).fill(.white).frame(width: 160, height: 50)
                                .overlay(
                                    HStack{
                                        Text("$\(Int(product.price))").font(.system(size: 24)).bold()
                                        Spacer()
                                        Image(systemName:"bag").imageScale(.large)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(.black)
                                            .clipShape(Circle())
                                            .offset(x:15)
                                            
                                    }.padding()
                                )
                        }.padding()
                    }
                    ,alignment: .topLeading)
        }.padding()
    }
}

#Preview {
    ProductCollectionView()
}
