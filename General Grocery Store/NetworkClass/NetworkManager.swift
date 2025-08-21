//
//  Untitled.swift
//  General Grocery Store
//
//  Created by Absolute on 08/07/25.
//

import Foundation
import Combine

class NetworkManager{
    static let shared = NetworkManager()
    
    private init(){}
    
    func requestOTP(for number : String) -> AnyPublisher<OTPResponse , Never>{
        
        let dummyResponse = OTPResponse(success: true, message: "OTP sent successfully")
        
        return Just(dummyResponse)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()

    }
    
    func fetchProducts() -> AnyPublisher<[Product], Never> {
        let dummyProducts: [Product] = [
            
            .init(name: "Banana", imageName: "Banana", price: 60, productSelected: false, productQuantity: 1, productDescription: "Bananas are rich in potassium and fiber. They help in digestion and boost energy. Perfect for a healthy snack any time of the day."),
            .init(name: "Apple", imageName: "Apple", price: 120, productSelected: false, productQuantity: 2, productDescription: "Apples are juicy and sweet, packed with antioxidants. They support heart health and immunity. A delicious fruit to enjoy every day."),
            .init(name: "Tamoto", imageName: "capcicum", price: 30, productSelected: false, productQuantity: 1, productDescription: "Tomatoes are loaded with vitamin C and lycopene. They improve skin health and reduce inflammation. Ideal for salads and curries.")

        ]
        
        return Just(dummyProducts)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
