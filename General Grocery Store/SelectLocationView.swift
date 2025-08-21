//
//  SelectLocationView.swift
//  General Grocery Store
//
//  Created by Absolute on 07/07/25.
//

import SwiftUI

struct SelectLocationView: View {
    @State var number : String = ""
    @State private var isDropdownOpen: Bool = false
    @State private var selectedZone: String = "Select Zone"
    let zoneOptions = ["North Zone", "South Zone", "East Zone", "West Zone"]
    
    @State private var isCityDropdownOpen: Bool = false
    @State private var selectedCity: String = "Select City"
    let cityOptions = ["Delhi", "Mumbai", "Lucknow", "Hyderabad"]
    
    @Environment(\.dismiss) private var dismiss
    @State private var goToNextScreen = false


    var body: some View {
        
            ScrollView{
                
                VStack{
                    
                    Image("location")
                        .resizable()
                        .frame(width: 224 , height: 170)
                        .padding(.top , 40)
                    
                    VStack(spacing: 8) {
                        
                        Text("Select Your Location")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.top , 40)
                        
                        Text("switch on your location to stay with whats happening in your area")
                            .foregroundColor(.gray)
                            .font(.title3)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Your Zone")
                            .foregroundColor(.gray)
                            .font(.title2)
                            .fontWeight(.medium)

                        Button(action: {
                            withAnimation {
                                isDropdownOpen.toggle()
                            }
                        }) {
                            HStack {
                                Text(selectedZone)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Image("dropdown") // your custom arrow image
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .rotationEffect(.degrees(isDropdownOpen ? 180 : 0))
                            }
                        }

                        if isDropdownOpen {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(zoneOptions, id: \.self) { zone in
                                    Text(zone)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(5)
                                        .onTapGesture {
                                            selectedZone = zone
                                            isDropdownOpen = false
                                        }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        }

                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal , 25)
                    .padding(.top , 80)
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Your City")
                            .foregroundColor(.gray)
                            .font(.title2)
                            .fontWeight(.medium)

                        Button(action: {
                            withAnimation {
                                isCityDropdownOpen.toggle()
                            }
                        }) {
                            HStack {
                                Text(selectedCity)
                                    .foregroundColor(.black)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Image("dropdown") // same arrow image
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .rotationEffect(.degrees(isCityDropdownOpen ? 180 : 0))
                            }
                        }

                        if isCityDropdownOpen {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(cityOptions, id: \.self) { city in
                                    Text(city)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(5)
                                        .onTapGesture {
                                            selectedCity = city
                                            isCityDropdownOpen = false
                                        }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        }

                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal , 25)
                    .padding(.top , 40)


                    Button(action: {
                        if selectedCity != "" && selectedZone != ""{
                            UserDefaults.standard.set(true, forKey: "isLocationDone")
                            goToNextScreen = true
                        }
                    }) {
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color("SplashBackground"))
                            .cornerRadius(8)
                    }
                    .padding(.vertical , 40)
                    .padding(.horizontal , 25)

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
                
                NavigationLink("", destination: MainTabView(), isActive: $goToNextScreen)
                    .hidden()
                            
            }
    }
    
}


#Preview {
    NavigationStack {
        SelectLocationView()
    }
}
