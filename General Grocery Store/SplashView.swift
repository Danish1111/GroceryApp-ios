//
//  RootView.swift
//  General Grocery Store
//
//  Created by Absolute on 01/07/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color("SplashBackground")
                .ignoresSafeArea()
            
            HStack(alignment: .center , spacing: 10) {
                Image("carrot")
                    .resizable()
                    .frame(width: 60 , height: 60)
                
                VStack(alignment: .center, spacing: 2){
                    Text("General Grocery Stroe")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("oneline grocceries")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                }
            }
            .padding(.horizontal, 5)
        }
    
    }
}

#Preview {
    SplashView()
}
