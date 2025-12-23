//
//  ItemProfileView.swift
//  FeedNewZalo
//
//  Created by Admin on 10/12/25.
//
import SwiftUI

struct ItemProfileView: View {
    var isshow: Bool = true
    var isshowText: Bool = true
    var avatar: String?
    @State var text: String?
    @State var subntext: String?
    var icon: String?
    var body: some View {
        HStack {
            Image(systemName: avatar ?? "")
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(25)
            
            VStack(alignment: .leading){
                    Text(text ?? "")
                if isshowText {
                    Text(subntext ?? "")
                    .font(.system(size: 14))
                    .opacity(0.5)
                }
                   
                }
            Spacer()
            if isshow {
                Image(systemName: icon ?? "" )
            }

        }
        .padding(.horizontal)
        }
    }


