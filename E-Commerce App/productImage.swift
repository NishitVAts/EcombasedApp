//
//  ProducttImageView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 13/02/24.
//

import SwiftUI

struct productImageView: View {
    @State var isDragging = false
    @Binding var product:ProductModel
    @State var position = CGSize.zero
    var body: some View {
        ScrollView(.horizontal){
            Image(product.image).resizable()
                .scaledToFit().frame(width: UIScreen.main.bounds.width*0.8)
                .padding()
        }.offset(CGSize(width: 25, height: 10.0))
            .offset(y:position.height).animation(.bouncy)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        position = value.translation
                        isDragging = true
                    })
                    .onEnded({ value in
                        position = .zero
                        isDragging = false
                        
                    })
            )
    }
}

