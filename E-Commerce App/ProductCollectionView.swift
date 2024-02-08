//
//  ProductCollectionView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 09/02/24.
//

import SwiftUI

struct ProductCollectionView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing:40){
                    Text("Order From The Best Of **Snacks**")
                        .font(.system(size: 32))
                    Image(systemName:"arrow.left")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 70, height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4)
                        )
                        
                }
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    ForEach(productList, id: \.id){
                        item in
                        ProductCardView(product: item)
                            .frame(width: 100, height: 100)
                    }
                })
            }
        }
    }
    
}

#Preview {
    ProductCollectionView()
}
