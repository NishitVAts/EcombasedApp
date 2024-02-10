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
    @State var isDragging = false
    @State var position = CGSize.zero
    @State var isCompleted = false
    var body: some View {
        ZStack{
            VStack{
                HStack(spacing:40){
                    Text(product.name).bold()
                        .font(.system(size: 40)).padding()
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
                    NavigationLink {
                        productImageView( product: $product)
                    } label: {
                        Image(product.image).resizable().scaledToFit()
                            .frame(height: 250) .offset(x:100)
                    }

                }.padding()
                    
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 40).rotation(.degrees(40)).fill(.black)
                        Image(systemName:"minus").font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 100, height: 100)
                    } .frame(width: 100, height:100)
                        .offset(x:-100).onTapGesture {
                            if (product.quantity != 0) {
                                product.quantity = product.quantity-1
                            }
                        }
                        .onLongPressGesture {
                            product.quantity = 0
                        }
                    Text("\(product.quantity)").font(.system(size: 40)).bold()
                    ZStack{
                        RoundedRectangle(cornerRadius: 40).rotation(.degrees(40)).fill(.black)
                        Image(systemName:"plus").font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 100, height: 100)
                    } .frame(width: 100, height:100)
                        .offset(x:100).onTapGesture{ product.quantity = product.quantity+1 }
                }
                HStack{
                    Text("Grand Total").font(.title2)
                    Spacer()
                    Text("$**\(Int(product.price)).00**").font(.system(size: 40)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal,50)
                GeometryReader { geo in
                    HStack{
                        Group{
                            Image(systemName:"cart").font(.title).frame(width: 70, height: 40).padding()
                                .background(.white).clipShape(.capsule).foregroundColor(.black)
                                .offset(x:position.width)
                                .animation(.bouncy)
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
                            
                            if isDragging {
                                if isCompleted{Text("Payment Completed")}
                                else{
                                    Text("")
                                }
                            } else {
                                Text("Make payment").font(.title3).fontWeight(.semibold)
                            }
                            
                        }.padding().foregroundColor(.white)
                    }.frame(width: UIScreen.main.bounds.width*0.9, height: 100)
                        .background(isDragging ? .green : .black).clipShape(.capsule)
                    .padding()
                }
              
            }
        }.navigationBarBackButtonHidden()
            .fontDesign(.rounded)
    }
}




#Preview {
    ProductTileView(product: productList[0])
   
}
