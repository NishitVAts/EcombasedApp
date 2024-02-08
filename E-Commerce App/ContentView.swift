//
//  ContentView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 08/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedCategory = productCategoryList[0]
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing:40){
                    Text("Order From The Best Of **Snacks**")
                        .font(.system(size: 36))
                    Image(systemName:"line.3.horizontal")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 70, height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4)
                        )
                        
                }
                CategoryListView(selectedCategory: $selectedCategory)
                    .padding(.leading,-10)
                HStack{
                    Text("Sweets **Collections**")
                        .font(.system(size: 26))
                    Spacer()
                    NavigationLink(destination: ProductCollectionView()) {
                        Image(systemName:"arrow.right")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }.padding()
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        ForEach(productList, id: \.id){ product in
                            ProductCardView(product: product)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
}
struct CategoryListView:View{
    @Binding var selectedCategory:String
    var body: some View{
        HStack{
            ScrollView(.horizontal, showsIndicators:false){
                HStack {
                    ForEach(productCategoryList, id:\.self){ item  in
                        Button(action: {
                            selectedCategory = item
                        }, label: {
                            HStack{
                                RoundedRectangle(cornerRadius: 25.0).fill( selectedCategory==item ? .black: .clear).frame(width: 100, height: 50)
                                    .overlay(
                                        Text(item).foregroundColor(selectedCategory==item ? .white: .black )
                                            
                                    )
                            }
                        })
                    }
                }
            }
        }
    }
}
struct ProductCardView:View {
    @State var product:ProductModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0).fill(product.bgColor.opacity(0.2)).frame(width: 300, height: 400)
                .overlay(
                    VStack(alignment: .leading){
                        Text(product.name).font(.system(size: 30)).bold()
                            .frame(width: 110)
                        Text(product.category.stringValue).font(.system(size: 15))
                            .padding()
                            .background(.ultraThickMaterial)
                            .clipShape(.rect(cornerRadius: 25))
                    Spacer()
                        RoundedRectangle(cornerRadius: 35.0).fill(.white).frame(width: 250, height: 70)
                            .overlay(
                                HStack(spacing:100){
                                    Text("$\(Int(product.price))").font(.system(size: 24)).bold()
                                    Image(systemName:"bag").imageScale(.large)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(.black)
                                        .clipShape(Circle())
                                        .offset(x:20)
                                }.padding()
                            )
                    }.padding()
                    ,alignment: .topLeading)
        }
    }
}

#Preview {
    ContentView()
}
