//
//  SignInView.swift
//  General Grocery Store
//
//  Created by Absolute on 03/07/25.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()

//    @State var number : String = ""
    @FocusState private var isNumberFocused: Bool
//    @State private var showValidationError = false
    @State private var navigateToOTP = false
    @Environment(\.dismiss) private var dismiss

//    var isValidNumber: Bool {
//          number.count == 10
//      }
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView{
                VStack{
                    Image("Vegs")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.45)
                        .ignoresSafeArea(edges: .top)
                    
                    
                    Text("Get your groceries with Store")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing , 50)
                    
                    HStack{
                        Image("Flag")
                            .resizable()
                            .frame(width: 33 , height: 23)
                        
                        ZStack(alignment: .leading) {
                            if viewModel.number.isEmpty {
                                Text("Enter number")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20, weight: .medium))
                            }
                            
                            TextField("", text: $viewModel.number)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .medium))
                                .keyboardType(.numberPad)
                                .focused($isNumberFocused)
                                .onChange(of: viewModel.number) { newValue in
                                    let filtered = newValue.filter {
                                        "0123456789".contains($0)
                                    }
                                    viewModel.number = String(filtered.prefix(10))
                                }
                        }
                        .frame(height: 30)
                        
                    }
                    .padding(.horizontal , 25)
                    .padding(.top , 30)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 25)
                    
                    
                    if viewModel.showValidationError {
                        Text("Please enter a valid 10-digit number.")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, 5)
                    }
                    
                    
                    Text("or connect with social media")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top , 20)
                    
                    
                    Button(action : {
                        isNumberFocused = false
                        
                        viewModel.submitNumber {
                            success in
                                if success {
                                    navigateToOTP = true
                                        }
                                }

//                        if isValidNumber{
//                            showValidationError = false
//                            isNumberFocused = false
//                            navigateToOTP = true
//                        }else{
//                            showValidationError = true
//                        }
                        
                    }){
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(viewModel.number.count == 10 ? Color.green : Color.gray)
                            .cornerRadius(5)
                    }
                    .disabled(viewModel.number.count != 10)
                    .padding(.horizontal, 25)
                    .padding(.top, 50)
                    
                    NavigationLink(destination: OTPScreenView(mubileNUmber : "\(viewModel.number)"), isActive: $navigateToOTP) {
                        EmptyView()
                    }

                    
                    Spacer()
                    
                    
                }
            }
            .ignoresSafeArea()
            .onTapGesture {
                isNumberFocused = false
            }
        }
        
        
            
    }
}

#Preview {
    SignInView()
}
