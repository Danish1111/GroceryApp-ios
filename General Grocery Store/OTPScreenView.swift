//
//  OTPScreenView.swift
//  General Grocery Store
//
//  Created by Absolute on 06/07/25.
//

import SwiftUI

struct OTPScreenView: View {
    var mubileNUmber : String = ""
    @State var number : String = ""
    @FocusState private var isNumberFocused: Bool
    @State private var showValidationError = false
    @State private var keyboardHeight: CGFloat = 0
    @State private var goToNextScreen = false
    @Environment(\.dismiss) private var dismiss

    var isValidNumber: Bool {
          number.count == 4
      }
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(){
                Text("Enter 4 Digit Code")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal , 20)
                    .padding(.top , 70)
                
                Text("Code")
                    .foregroundColor(.gray)
                    .font(.title3)
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal , 20)
                    .padding(.top , 20)
                
                
                ZStack(alignment: .leading) {
                    if number.isEmpty {
                        Text("Enter number")
                            .foregroundColor(.gray)
                            .font(.system(size: 20, weight: .medium))
                    }
                    
                    TextField("", text: $number)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                        .keyboardType(.numberPad)
                        .focused($isNumberFocused)
                        .onChange(of: number) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered.count > 10 {
                                number = String(filtered.prefix(10))
                            } else {
                                number = filtered
                            }
                        }
                }
                .frame(height: 30)
                .padding(.horizontal , 25)
                .padding(.top , 20)
                
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 25)
                    .padding(.top , 10)
                
                
                if showValidationError {
                    Text("Please enter a valid 10-digit number.")
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.top, 5)
                }
                
                Spacer()
                
                HStack{
                    
                    Text("Resend Code")
                        .foregroundColor(Color("SplashBackground"))
                        .font(.system(size: 20, weight: .medium))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity , alignment:.leading)
                    
                    Image("floatBt")
                        .resizable()
                        .frame(width: 67 , height: 67)
                        .onTapGesture {
                            goToNextScreen = true
                        }
                    
                }
                .padding(.horizontal , 20)
                .padding(.bottom, keyboardHeight == 0 ? 50 : keyboardHeight + 10)
                .onAppear{
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                        if let frame = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                            self.keyboardHeight = frame.height
                        }
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                        self.keyboardHeight = 0
                    }
                    
                }
                
                NavigationLink("", destination: SelectLocationView(), isActive: $goToNextScreen)
                    .hidden()
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        OTPScreenView()
    }
}
