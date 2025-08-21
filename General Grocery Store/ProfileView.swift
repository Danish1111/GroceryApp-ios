//
//  ProfileView.swift
//  General Grocery Store
//
//  Created by Absolute on 04/08/25.
//

import SwiftUI

struct ProfileView: View {
    
    let profiles: [ProfileModel] = [
        ProfileModel(imageIcon: "order", name: "Orders"),
        ProfileModel(imageIcon: "card", name: "My Details"),
        ProfileModel(imageIcon: "locationIcon", name: "Delivery Address"),
        ProfileModel(imageIcon: "card", name: "Payment Methods"),
        ProfileModel(imageIcon: "promo", name: "Promo Cord ") ,
        ProfileModel(imageIcon: "Bellicon", name: "Notification"),
        ProfileModel(imageIcon: "helpIcon", name: "Help"),
        ProfileModel(imageIcon: "aboutIcon", name: "About")
    ]
    
    var body: some View {
        VStack{
            HStack() {
                Image("profileImage")
                    .resizable()
                    .frame(width: 64 , height: 64)
                
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Afsar Hussain")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Image("edit")
                            .resizable()
                            .frame(width: 15 ,height: 15)
                        
                    }
                    
                    Text(verbatim: "himanshu@gmail.com")
                        .foregroundColor(.gray)
                        .font(.title2)
                        .fontWeight(.regular)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .padding(.horizontal , 20)
            .padding(.top , 10)
            
            Rectangle()
                .foregroundColor(.lightGray)
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.horizontal , 20)
            
            
            ScrollView{
                
                ForEach(profiles) { profile in
                    ProfileCellView(profileModel: profile)
                }

            }
        
        }
    }
}

#Preview {
    ProfileView()
}

struct ProfileCellView: View {
    var profileModel : ProfileModel
    
    var body: some View {
        HStack{
            
            Image(profileModel.imageIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25 ,height: 25)
            
            
            Text(profileModel.name)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity ,alignment: .leading)
                .padding(.leading , 10)
            
            
            Image("rightArrow")
                .resizable()
                .frame(width: 8 ,height: 14)
            
        }
        .padding(.horizontal , 20)
        .padding(.vertical , 20)
        
        
        Rectangle()
            .foregroundColor(.lightGray)
            .frame(maxWidth: .infinity, maxHeight: 1)
            .padding(.horizontal , 20)

        
    }
}


struct ProfileModel : Identifiable{
    var id = UUID()
    var imageIcon : String
    var name : String
}
