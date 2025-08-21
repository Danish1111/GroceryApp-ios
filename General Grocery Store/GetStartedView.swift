//
//  GetStartedView.swift
//  General Grocery Store
//
//  Created by Absolute on 02/07/25.
//

import SwiftUI

struct GetStartedView: View {
    @State private var isNavigated = false
    @AppStorage("has_started") var hasStarted = false
    
    var body: some View {

        ZStack{
                Image("backgroundmen")
                    .resizable()
                    .scaledToFill()
                
                VStack(spacing: 20){
                    
                    Spacer()
                    
                    Image("carrot")
                        .resizable()
                        .frame(width: 50 , height: 60)
                    
                    Text("Welcome to our store")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    
                    Text("Get your groceries in as fast as one hour")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.bottom , 20)
                    
                    Button(action : {
                        hasStarted = true
                    }){
                        Text("Get Started")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 70)
                }
                
            }.ignoresSafeArea()
                    
    }
}

#Preview {
    GetStartedView()
}
