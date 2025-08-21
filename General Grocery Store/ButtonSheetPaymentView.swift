//
//  ButtonSheetPaymentView.swift
//  General Grocery Store
//
//  Created by Absolute on 07/08/25.
//

import SwiftUI

struct ButtonSheetPaymentView: View {
    var body: some View {
       
        VStack{
            HStack{
                Text("Checkout")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity , alignment: .leading)
                
                Image("cross")
                    .resizable()
                    .frame(width: 15,height: 15)
            }
            .padding(.top , 30)
            .padding(.horizontal , 20)
        }
    }
}

#Preview {
    ButtonSheetPaymentView()
}
