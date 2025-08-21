//
//  Untitled.swift
//  General Grocery Store
//
//  Created by Absolute on 29/07/25.
//

import SwiftUI

struct LineView: View {
    var body: some View {
        Rectangle()
            .fill(.lightGray)
            .frame(height: 1)
            .padding(.top , 30)
            .padding(.horizontal , 20)
    }
}

struct ButtonSubmit: View {
    let text : String
    let action: () -> Void

    var body: some View {
        Button(action: action){
            Text(text)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(height: 65)
                .frame(maxWidth: .infinity)
                .background(Color("SplashBackground"))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.vertical , 20)
               
        }
    }
}
