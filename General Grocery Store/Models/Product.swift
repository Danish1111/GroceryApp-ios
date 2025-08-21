//
//  Product.swift
//  General Grocery Store
//
//  Created by Absolute on 13/07/25.
//

import Foundation

struct Product : Identifiable , Codable{
    var id = UUID()
    let name : String
    let imageName : String
    let price : Double
    var productSelected: Bool
    var productQuantity: Int
    var productDescription: String
}

extension Product{
    static let sample: [Product] = [        
        .init(name: "Banana", imageName: "Banana", price: 60, productSelected: false, productQuantity: 1, productDescription: "Bananas are rich in potassium and fiber. They help in digestion and boost energy. Perfect for a healthy snack any time of the day."),
        .init(name: "Apple", imageName: "Apple", price: 120, productSelected: false, productQuantity: 2, productDescription: "Apples are juicy and sweet, packed with antioxidants. They support heart health and immunity. A delicious fruit to enjoy every day."),
        .init(name: "Tamoto", imageName: "capcicum", price: 30, productSelected: false, productQuantity: 1, productDescription: "Tomatoes are loaded with vitamin C and lycopene. They improve skin health and reduce inflammation. Ideal for salads and curries.")

    ]
}



