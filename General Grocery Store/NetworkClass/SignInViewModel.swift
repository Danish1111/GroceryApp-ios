//
//  SignInViewModel.swift
//  General Grocery Store
//
//  Created by Absolute on 08/07/25.
//

import Foundation
import Combine

class SignInViewModel : ObservableObject{
    @Published var number : String = ""
    @Published var showValidationError = false
    @Published var navigateToOTP = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func submitNumber(completion : @escaping (Bool) -> Void){
        
        guard number.count == 10 else {
            showValidationError = true
            return
        }
        
        showValidationError = false

        NetworkManager.shared.requestOTP(for: number)
            .sink { response in
                completion(response.success)
            }
            .store(in: &cancellables)
    }

}
