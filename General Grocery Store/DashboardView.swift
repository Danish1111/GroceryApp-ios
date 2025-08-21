//
//  DashboardView.swift
//  General Grocery Store
//
//  Created by Absolute on 11/07/25.
//

import SwiftUI

struct DashboardView: View {
   
    @State private var searchText = ""
    
    private let images = ["Pulses", "Pulses", "Pulses"]
    
    @State private var currentIndex = 0
    @StateObject private var viewModel = ProductViewModel()
    
    private let timer = Timer
            .publish(every: 3, on: .main, in: .common)
            .autoconnect()
    
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        
        
        NavigationStack{
            
            ScrollView{
                
                VStack{
                    
                    Image("redCarrot")
                        .resizable()
                        .frame(width: 26 , height: 30)
                        .padding(.top , 10)
                    
                    HStack{
                        Image(systemName: "location")
                            .resizable()
                            .frame(width: 15 , height: 18)

                        Text(locationManager.city)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding(.top , 5)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search here...", text: $searchText)
                            .foregroundColor(.primary)
                            .frame(height: 35)
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal , 24)
                    .padding(.top , 23)
                    
                    TabView(selection: $currentIndex){
                        ForEach(images.indices, id: \.self) { i in
                            Image(images[i])
                                .resizable()
                                .scaledToFill()
                                .frame(height: 114)
                                .clipped()
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .tag(i)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 114)
                    .onReceive(timer) { _ in
                        currentIndex = (currentIndex + 1) % images.count
                    }
                    .padding(.top , 20)
                    
                    HStack{
                        Text("Exclusive Offer")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()

                        Text("see all")
                            .foregroundColor(Color("SplashBackground"))
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal , 24)
                    .padding(.top , 30)
                    
                    if viewModel.products.isEmpty {
                        ProgressView()
                            .padding()
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(viewModel.products) { product in
                                    
                                    NavigationLink(destination: ProductDetailView(product: product)) {
                                            ProductCard(product: product)
                                        }
                                        .buttonStyle(PlainButtonStyle())
//                                    ProductCard(product: product)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .frame(height: 275)
                    }
                    
                    HStack{
                        Text("Groceries Offer")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()

                        Text("see all")
                            .foregroundColor(Color("SplashBackground"))
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal , 24)
                    .padding(.top , 30)
                    
                    if viewModel.products.isEmpty {
                        ProgressView()
                            .padding()
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(viewModel.products) { product in
                                    ProductCard(product: product)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .frame(height: 275)
                    }
                }
                .onAppear(){
                    viewModel.loadProducts()
                }
            }

        }
        .navigationBarHidden(true)

    }
}

#Preview {
    DashboardView()
}
