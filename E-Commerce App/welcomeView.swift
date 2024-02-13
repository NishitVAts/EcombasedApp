//
//  welcomeView.swift
//  E-Commerce App
//
//  Created by Nishit Vats on 11/02/24.
//

import SwiftUI

struct welcomeView: View {
    var body: some View {
        ZStack{
            Color.orange.opacity(0.4).ignoresSafeArea()
            VStack{
                Text("Order from the best Snacks").font(.system(size: 70))
                    .bold()
                ZStack{
                    WelcomeCardsView(product: productList[0], tagLine: "Cheetos, Lays and many more!")
                    Image("Lays").resizable().scaledToFit().rotationEffect(.degrees(-15)).frame(width: 300).offset(x:130,y:230).padding()
                    Image("Doritos").resizable().scaledToFit().rotationEffect(.degrees(15)).frame(width: 300).offset(x:-130,y:230).padding()
                    Image("Maggi").resizable().scaledToFit().rotationEffect(.degrees(230)).frame(width: 300).offset(x:180,y:-200).padding()
                }
                
                HStack{
                    RoundedRectangle(cornerRadius: 25.0).fill(.black).frame(width:250,height: 80)
                        .overlay(Text("Get Started!")
                            .font(.system(size:30)).bold()).foregroundColor(.white)
                }
            }
        }
    }
}

struct WelcomeCardsView:View {
    @State var product:ProductModel
    @State var tagLine:String
    var body: some View {
        VStack{
            Image(product.image).resizable().scaledToFit()
                .rotationEffect(.degrees(40))
                .offset(x:30,y:80)
                .frame(width: 250, height: 300)
                .overlay(
                    Text(tagLine).font(.system(size: 36))
                        .frame(width: 150).bold()
                        .fontDesign(.rounded)
                    ,alignment: .topLeading)
                .padding()
                .background(.red.opacity(0.4))
                .clipShape(.rect(cornerRadius: 30))
        }
    }
}

#Preview {
    welcomeView()
}
