//
//  KhoanKhacView.swift
//  FeedNewZalo
//

import SwiftUI

struct KhoanhKhacView: View {
    @StateObject var vm = UserViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Khoảnh khắc")
                .font(.title2.bold())
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    if let data = self.vm.story {
                        ForEach(data.stories) { moment in
                            MomentCard(moment: moment)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear() {
                Task {
                    await self.vm.getStory(id: 1)
                }
            }
        }
        
    }
}


struct MomentCard: View {
    
    var moment: StoryItem
    
    var body: some View {
        ZStack(alignment: .centerLastTextBaseline) {
            
            // Ảnh nền
            Image(moment.image ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 180)
                .clipped()
                .cornerRadius(18)
            
            // Gradient phía dưới
            LinearGradient(
                colors: [.clear, .black.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(width: 110, height: 180)
            .cornerRadius(18)
            
            VStack(alignment: .center, spacing: 6) {
                
                // Avatar
                if moment.isCreate ?? false {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "video.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 8))
                    }
                
                } else {
                    ZStack {
                        Circle()
                            .stroke(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 3
                            )
                            .frame(width: 50, height: 50)
                        
                        Image(moment.avatar ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    }
                    
                }
                
                Text(moment.name ?? "")
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
            }
            
            
            
        }
        .frame(width: 110, height: 180)
    }
}
