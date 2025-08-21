//
//  ProductCard.swift
//  General Grocery Store
//
//  Created by Absolute on 13/07/25.
//

import SwiftUI

struct ProductCard: View {
    let product : Product
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
                
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top , 15)
            
                Text("\(product.price.clean) Rs, price g")
                    .font(.title3)
                    .foregroundColor(.gray)

                HStack{
                    Text("\(product.price.clean) Rs")
                        .font(.title2)
                        .fontWeight(.semibold)
                                        
                    Spacer()
                    
                    Button {
                                    
                    } label: {
                       Image("addBt")
                           .resizable()
                           .frame(width: 45, height: 45)
                    }
                }
                .padding(.top , 15)
                
            }
        .padding(15)
        .frame(width: 200, height: 270)
        .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
               )
            
    }
}

#Preview {
    ProductCard(product: Product.sample.first!)
}
