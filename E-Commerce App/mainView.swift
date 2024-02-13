//
//  HomeView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 17/02/24.
//

import SwiftUI

struct mainView: View {
    @Environment(\.dismiss) private var dismiss
    @State var product:ProductModel
    @State var selectedFilter = "All"
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    HStack{
                        Text("Orde From the best of the **Snacks**")
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
                    CategoryListView(selectedCategory: $selectedFilter)
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            ForEach(categorisedList(var: selectedFilter), id: \.id){
                                item in
                                NavigationLink {
                                    ProductTileView(product: item)
                                } label: {
                                    collectionCardView(product: item)
                                }.foregroundColor(.black)
                            }
                        })
                    }
                    
                    
                    
                }
                VStack{
                    Spacer()
                    if (cartItems.count>1){
                        cartDownView(cartProducts: cartItems, showCart: false)
                            
                    }
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
        
    }
}

struct  cartDownView: View{
    @State var cartProducts:[ProductModel]
    @State var showCart:Bool = false
    var body:some View{
        VStack{
            HStack{
                Text("\(cartProducts.count)")
                    .font(.title)
                    .padding()
                    .background(.yellow)
                    .clipShape(Circle())
                    .foregroundColor(.black)
                    .bold()
                VStack(spacing:-10){
                    Text("Cart").font(.title)
                        .padding().fontDesign(.rounded).bold()
                    Text("\(cartProducts.count) items")
                }
                if (cartProducts.count <= 4) {
                    ForEach(cartProducts, id:\.id){ item in
                        Image(item.image).resizable()
                            .scaledToFit()
                    }
                }
            }
        }.padding()
            .frame(width: UIScreen.main.bounds.width,height: 100, alignment: .bottom)
            .background(.black)
            .cornerRadius(30)
            .foregroundColor(.white)
    }
}

#Preview {
    mainView(product: productList[0])
}
