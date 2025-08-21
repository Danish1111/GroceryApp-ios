//
//  CartView.swift
//  General Grocery Store
//
//  Created by Absolute on 01/08/25.
//

import SwiftUI

struct CartView: View {
    
    @State private var showBottomSheet = false
    
    @State private var products: [Product] = WishCardManager.shared.getProducts()
    
    var body: some View {
        
        VStack{
            
            ZStack {
                Text("Favourite")
                    .font(.title2)
                    .fontWeight(.bold)

                HStack {
                    Spacer()
                    
                    Button(action:{
                        WishCardManager.shared.clearWishCard()
                        products = WishCardManager.shared.getProducts()
                    }){
                        Image("delete")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                   
                }
                .padding(.trailing , 20)
            }
          
            
            
            
            Rectangle()
                .foregroundColor(Color("LightGray"))
                .frame(maxWidth: .infinity , maxHeight: 1)
                .padding(.top , 20)
                .onAppear{
                    products = WishCardManager.shared.getProducts()
                }
            
            
            if !products.isEmpty{
                
                ScrollView {
                    ForEach(products, id: \.id) { product in
                        CartCellView(product: product)
                    }
                }
                
                Spacer()
                
                ButtonSubmit(text: "Submit") {
                    showBottomSheet = true
                }
            }else{
                Spacer()
                
                Text("Empty Cart")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()

            }
            
         

        }
        .sheet(isPresented: $showBottomSheet) {
            
        }
    }
}

#Preview {
    CartView()
}

