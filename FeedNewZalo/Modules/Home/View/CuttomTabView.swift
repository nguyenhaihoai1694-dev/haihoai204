//
//  CuttomTabView.swift
//  FeedNewZalo
//
//  Created by Admin on 2/12/25.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0   // 0 = Nhật ký, 1 = Zalo Video

    var body: some View {
        VStack(spacing: 0) {
            
            // --- Thanh tab ---
            HStack {
                
                // TAB 1: Nhật Ký
                Button(action: {
                    selectedTab = 0
                }) {
                    VStack {
                        Text("Nhật Ký")
                            .foregroundColor(selectedTab == 0 ? .black : .gray)
                            .font(.system(size: 18, weight: selectedTab == 0 ? .bold : .regular))

                        // Gạch chân
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(selectedTab == 0 ? .black : .clear)
                            .padding(.horizontal, 10)
                    }
                }
                .frame(maxWidth: .infinity)

                // TAB 2: Zalo Video
                Button(action: {
                    selectedTab = 1
                }) {
                    VStack {
                        Text("Zalo Video")
                            .foregroundColor(selectedTab == 1 ? .black : .gray)
                            .font(.system(size: 18, weight: selectedTab == 1 ? .bold : .regular))

                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(selectedTab == 1 ? .black : .clear)
                            .padding(.horizontal, 10)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 10)
            .padding(.bottom, 5)
            
            Divider()

            // --- Nội dung ---
            if selectedTab == 0 {
                DiaryView()
            } else {
                Text("Màn hình Zalo Video")
                    .font(.largeTitle)
            }

            Spacer()
        }
    }
}
