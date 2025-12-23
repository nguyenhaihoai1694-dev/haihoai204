import SwiftUI

struct ZaloPostView: View {
    
    var avatar: String = "avatar1"
    var name: String = "Hà Queen"
    var time: String = "5 phút trước"
    var content: String = "Hôm nay trời đẹp quá mọi người ơi! Ai đi chơi không 😍"
    
    /// LIST IMAGE
    var images: [String] = ["demo1", "demo2", "demo3"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // HEADER
            HStack(spacing: 12) {
                Image(avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(name).font(.headline)
                    Text(time).font(.caption).foregroundColor(.gray)
                }
                
                Spacer()
                Image(systemName: "ellipsis").foregroundColor(.gray)
            }
            
            // CONTENT
            Text(content)
                .font(.body)
            
            // IMAGES LAYOUT
            buildImageLayout()
            
            // ACTION BAR
            HStack {
                Spacer()
                HStack(spacing: 6) { Image(systemName: "hand.thumbsup"); Text("Thích") }
                Spacer()
                HStack(spacing: 6) { Image(systemName: "message"); Text("Bình luận") }
                Spacer()
                HStack(spacing: 6) { Image(systemName: "arrowshape.turn.up.right"); Text("Chia sẻ") }
                Spacer()
            }
            .padding(.vertical, 8)
            .font(.subheadline)
            .foregroundColor(.gray)

        }
        .padding(.horizontal)
    }
    
    
    // MARK: - MULTI IMAGE HANDLING
    @ViewBuilder
    func buildImageLayout() -> some View {
        
        let count = images.count
        
        if count == 1 {
            // 1 ẢNH — FULL WIDTH
            Image(images[0])
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .clipped()
                .cornerRadius(12)
            
        } else if count == 2 {
            // 2 ẢNH — CHIA ĐÔI
            HStack(spacing: 6) {
                ForEach(images, id: \.self) { img in
                    Image(img)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width/2 - 30, height: 250)
                        .clipped()
                        .cornerRadius(12)
                }
            }
            
        } else if count >= 3 {
            // ≥ 3 ẢNH — GRID ZALO STYLE
            VStack(spacing: 6) {
                
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(12)

                HStack(spacing: 6) {
                    ForEach(images.prefix(3).dropFirst(), id: \.self) { img in
                        ZStack {
                            Image(img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width/2 - 16, height: 120)
                                .clipped()
                                .cornerRadius(12)
                        }
                    }
                }
            }
        }
    }
}

