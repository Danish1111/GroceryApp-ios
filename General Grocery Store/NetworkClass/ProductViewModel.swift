//
//  ProductViewModel.swift
//  General Grocery Store
//
//  Created by Absolute on 16/07/25.
//

import Foundation
import Combine

class ProductViewModel : ObservableObject{

    @Published var products : [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func loadProducts(){
        NetworkManager.shared.fetchProducts()
            .sink { [weak self] fetchedProducts in
                    self?.products = fetchedProducts
                }
            .store(in: &cancellables)

    }
    
}
