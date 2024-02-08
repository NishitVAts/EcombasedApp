//
//  ContentView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 08/02/24.
//

import SwiftUI

enum ViewSelector{
    case home, search, cart
}

struct ContentView: View {
    @State var selectedView:ViewSelector = .home
    var body: some View {
        NavigationStack {
            ZStack{
                switch selectedView {
                case .home:
                    HomeView().animation(.easeInOut)
                case .search:
                    CartView().animation(.easeInOut)
                case .cart:
                    CartView().animation(.easeInOut)
                }
                VStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.black.opacity(0.9)).frame(height: 100)
                        .overlay(
                            HStack(){
                                Image(systemName: "magnifyingglass").imageScale(.large)
                                    .foregroundColor(selectedView == .search ? Color.black : Color.white)
                                    .padding()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .background(selectedView == .search ?  Color.white: Color.white.opacity(0.3) )
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        selectedView = .search
                                    }
                                    .animation(.easeInOut)
                                
                                Image(systemName: "house").foregroundColor(selectedView == .home ? Color.black : Color.white)
                                    .padding()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .background(selectedView == .home ?  Color.white: Color.white.opacity(0.3) )
                                    .clipShape(Circle())
                                    .imageScale(.large)
                                    .onTapGesture {
                                        selectedView = .home
                                    }
                                    .animation(.easeInOut)
                                
                                Image(systemName: "cart").foregroundColor(selectedView == .cart ? Color.black : Color.white)
                                    .padding()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .background(selectedView == .cart ?  Color.white: Color.white.opacity(0.3) )
                                    .clipShape(Circle())
                                    .imageScale(.large)
                                    .onTapGesture {
                                        selectedView = .cart
                                    }
                                    .animation(.easeInOut)
                                
                            }.padding(.bottom,40)
                            
                        )
                }.offset(y:30)
                    
            }.ignoresSafeArea()
                .foregroundColor(.black)
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
                                RoundedRectangle(cornerRadius: 25.0).fill( selectedCategory==item ? .black:.white.opacity(0.8)).frame(width: 100, height: 50)
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

struct ProductCardView:View{
    @State var product:ProductModel
    var body: some View{
        NavigationLink {
            ProductTileView(product: product)
        } label: {
            ZStack{
                Image(product.image).resizable().scaledToFit().rotationEffect(.degrees(40)).offset(x:50,y:80)
                VStack(alignment:.leading){
                    Text(product.name).font(.system(size: 36)).bold()
                    Text(product.category.stringValue).font(.callout).padding().background(.regularMaterial).clipShape(.capsule)
                    Spacer()
                    HStack{
                        Text("$\(Int(product.price))").font(.title).bold().padding()
                        Spacer()
                        Button(action: {
                            cartItems.append(product)
                        }, label: {
                            Image(systemName:"cart").imageScale(.large).padding().background(.black).clipShape(.circle).foregroundColor(.white)
                                .offset(x:15)
                        })
                    }.frame(width: 200, height: 30).padding().background(.white).clipShape(.capsule)
                }.padding()
            }   .frame(width: 300, height: 400)
                .padding()
                .background(product.bgColor.opacity(0.4))
                .clipShape(.rect(cornerRadius: 50))
                .fontDesign(.rounded)
        }

        
            
         
    }
}
//struct ProductCardView:View {
//    @State var product:ProductModel
//    var body: some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 25.0).fill(product.bgColor.opacity(0.2)).frame(width: 300, height: 400)
//                .overlay(
//                    ZStack {
//                        VStack(alignment: .leading){
//                            Text(product.name).font(.system(size: 30)).bold()
//                                .frame(width: 130)
//                            Text(product.category.stringValue).font(.system(size: 15))
//                                .padding()
//                                .background(.ultraThickMaterial)
//                                .clipShape(.rect(cornerRadius: 25))
//                        Spacer()
//                            RoundedRectangle(cornerRadius: 35.0).fill(.white).frame(width: 250, height: 70)
//                                .overlay(
//                                    HStack(spacing:100){
//                                        Text("$\(Int(product.price))").font(.system(size: 24)).bold()
//                                        Image(systemName:"bag").imageScale(.large)
//                                            .foregroundColor(.white)
//                                            .padding()
//                                            .background(.black)
//                                            .clipShape(Circle())
//                                            .offset(x:20)
//                                    }.padding()
//                                )
//                        }.padding()
//                    }
//                    ,alignment: .topLeading)
//        }
//    }
//}

#Preview {
    ContentView()
}

struct HomeView: View {
    @State var selectedCategory = productCategoryList[0]
    var body: some View {
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
                Text("Chips **Collections**")
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
        .navigationBarBackButtonHidden()
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

//CartView
//if cartItems.isEmpty{
//    EmptyView()
//}else{
//    VStack{
//        Spacer()
//        RoundedRectangle(cornerRadius: 50).frame(height: 130)
//            .overlay(
//                HStack {
//                    Text("\(totalItemsPresent)").padding().background(.yellow).clipShape(.circle).frame(width: 70).bold()
//                    VStack{
//                        Text("Cart").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        Text("\(totalItemsPresent) Items")
//                    }.foregroundColor(.white)
//                    Spacer()
//                    ForEach(cartItems){ item in
//                        ZStack{
//                            Image(item.image).resizable()
//                                .imageScale(.large)
//                                .scaledToFit()
//                                .padding()
//                                .frame(width: 50)
//                                .background(item.bgColor)
//                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                                .padding(.leading,-30)
//                        }
//                    }
//                }.padding()
//            )
//    }.ignoresSafeArea()
//        .offset(y:50)
//        .animation(.bouncy)
//}
