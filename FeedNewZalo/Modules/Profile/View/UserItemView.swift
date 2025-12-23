//
//  UserItemView.swift
//  FeedNewZalo
//
//  Created by Admin on 10/12/25.
//
import SwiftUI


struct UserItemView: View {
    var avatar: String?
    @State var name: String?
    @State var subname: String?
    var icon: String?
    
    var body: some View {
        HStack(){
            Image(avatar ?? "")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            VStack(alignment: .leading){
                Text(name ?? "")
                Text(subname ?? "")
                    .font(.system(size: 14))
                    .opacity(0.5)
                }
            Spacer()
            
            Image(systemName: icon ?? "")
        }
        .padding()
    }
}
