//
//  MainTabView.swift
//  General Grocery Store
//
//  Created by Absolute on 15/07/25.
//

import SwiftUI

struct MainTabView: View {
    
    init(){
        UITabBar.appearance().unselectedItemTintColor = .black
        UITabBar.appearance().tintColor = .black
    }
    
    var body: some View {
        TabView{
            DashboardView()
                .tabItem {
                    Image("store")
                    Text("Store")
                }
            
            
            NavigationView {
                CartView()
            }
            .tabItem {
                Image("cart")
                Text("Cart")
            }
            
            ProfileView()
                .tabItem {
                    Image("profile")
                    Text("Account")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
