//
//  RootView.swift
//  General Grocery Store
//
//  Created by Absolute on 01/07/25.
//

import SwiftUI

struct RootView: View {
    @State private var showSplash = true
    @AppStorage("has_started") var hasStarted = false
    @AppStorage("isLocationDone") var isLocationDone = false
    
    var body: some View {
        ZStack{
            
            if isLocationDone{
                MainTabView()
            }else{
                if hasStarted{
                    SignInView()
                }else{
                    if showSplash{
                        SplashView()
                    }else{
                        GetStartedView()
                    }
                }
            }

           
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                showSplash = false
                        }
                }
        }
        
    }

}

#Preview {
    RootView()
}
