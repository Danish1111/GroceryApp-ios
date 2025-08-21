//
//  ProductDetailView.swift
//  General Grocery Store
//
//  Created by Absolute on 17/07/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product : Product
    
    @State var buttonPressed = false
    @State var productNumber = 1
    @State var productAdded = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            
        ScrollView{
            
            VStack(spacing: 0){
                
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(Color("LightGray"))
                        .frame(height: 370)
                        .edgesIgnoringSafeArea(.top)
                        .zIndex(0)
                    
                    VStack {
                        HStack {
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }){
                                Image("back")
                                    .resizable()
                                    .frame(width: 10, height: 18)

                            }
                            
                            
                            Spacer()
                            
                            Image("download")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24, height: 24)
                        }
                        .padding()
                        .zIndex(2)
                        
                        Spacer()
                    }
                    
                    Image(product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 330, height: 200)
                        .zIndex(1)
                        .padding(.top, 100)
                }

                
                HStack{
                    VStack(spacing: 0){
                        
                        Text(product.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding(.leading , 20)
                            .padding(.top , 20)
                        
                        Text("\(product.price, specifier: "%.0f") per Kg")
                            .font(.title3)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding(.leading , 20)
                            .padding(.top , 10)
                    }
                    
                    Button(action :{
                        if buttonPressed == true{
                            buttonPressed = false
                        }else{
                            buttonPressed = true
                        }
                    }){
                        
                        Image(buttonPressed ? "filledHeart" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24 , height: 24)
                            .padding(.trailing , 20)
                    }
            
                }
                
                HStack{
                    
                    HStack(spacing: 20 ){
                        
                        Button(action: {
                            if productNumber != 1 {
                                productNumber = productNumber - 1
                            }
                        }){
                            Image("minus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16 , height: 16)
                        }

                        ZStack(alignment: .center){
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                                .frame(width: 45 , height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                )
                                .zIndex(0)
                            
                            Text("\(productNumber)")
                                .font(.title3)
                                .fontWeight(.semibold)
                        
                        }
                        
                        Button(action: {
                            productNumber = productNumber + 1
                        }){
                            Image("plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16 , height: 16)
                        }
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    
                    Text("\(product.price * Double(productNumber), specifier: "%.0f") Rs")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.top , 30)
                .padding(.horizontal , 20)
                

                LineView()
                

                Text("Product Detail")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.leading , 20)
                    .padding(.top , 20)
                
                Text(product.productDescription)
                    .foregroundColor(.gray)
                    .font(.title3)
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal , 20)
                    .padding(.top , 20)
                
                
                LineView()
                
                HStack(alignment: .center){
                    
                    Text("Nutritions")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.leading , 20)
                                        
                }
                .padding(.top , 20)
                
                
                LineView()
                
                HStack(alignment: .center){
                    
                    Text("Reviews ")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.leading , 20)
                                        

                }
                .padding(.top , 20)
                
                
                ButtonSubmit(text: "Add To Basket", action: {
                    WishCardManager.shared.addProduct(product)
                    productAdded = true
                })
                .alert(isPresented: $productAdded) {
                    Alert(
                        title: Text("Success"),
                        message: Text("Your product was added to wishcard"),
                        dismissButton: .default(Text("OK"), action: {
                            presentationMode.wrappedValue.dismiss() 
                        })
                    )
                }

            }
        }
        .navigationBarHidden(true)
        
    }
}

#Preview {
    ProductDetailView(product: Product.sample[0])
}


