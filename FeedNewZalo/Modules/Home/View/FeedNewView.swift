import SwiftUI

struct FeedNewView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // MARK: - Avatar + "Hôm nay bạn thế nào?"
            HStack(spacing: 12) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.blue)

                Text("Hôm nay bạn thế nào?")
                    .foregroundColor(.gray)
                    .font(.body)

                Spacer()
            }
            .padding(.vertical, 10)
            // MARK: - Hàng nút Ảnh – Video – Viết bài
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {

                    HStack {
                        Image(systemName: "photo.on.rectangle")
                            .foregroundColor(Color.green)
                        Text("Ảnh")
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    HStack {
                        Image(systemName: "video.fill")
                        .foregroundColor(Color.purple)
                        Text("Video")
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    HStack {
                        Image(systemName: "square.and.pencil")
                        .foregroundColor(Color.blue)
                        Text("Viết bài")
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    HStack {
                        Image(systemName: "doc.text.fill")
                        .foregroundColor(Color.orange)
                        Text("Bài viết dài")
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    HStack {
                        Image(systemName: "music.note")
                    .foregroundColor(Color.yellow)
                        Text("Âm nhạc")
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                }
                .padding(.horizontal)
                .font(.subheadline)
                .foregroundColor(.blue)
            }


        }
        .padding()
        .shadow(radius: 1)
        .padding(.horizontal)
    }
}
