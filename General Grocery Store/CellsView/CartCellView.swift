//
//  Untitled.swift
//  General Grocery Store
//
//  Created by Absolute on 01/08/25.
//

import Foundation
import SwiftUI

struct CartCellView: View {
    
    let product : Product
    
    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 50 , height: 50)
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(product.productQuantity)")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .fontWeight(.regular)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading , 30)
            
            Text("\(product.price, specifier: "%.0f") Rs")
                .font(.title2)
                .fontWeight(.bold)
                        
            
        }
        .padding(.top , 30)
        .padding(.horizontal, 20)
    }
}
