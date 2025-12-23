//
//  DiaryView.swift
//  FeedNewZalo
//
//  Created by Admin on 2/12/25.
//
import SwiftUI
struct DiaryView: View {
    var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
        VStack {
            FeedNewView()
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .foregroundColor(.gray)
                .opacity(0.3)
               
            KhoanhKhacView()
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            ZaloPostView()
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .foregroundColor(.gray)
                .opacity(0.3)
            ZaloVideoView()
            
        }
            
        }
        
    }
}
