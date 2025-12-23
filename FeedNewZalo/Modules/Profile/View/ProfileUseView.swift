
import SwiftUI

struct ZaloProfileView: View {
   
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                
                
                ZStack(alignment: .bottom) {
                    
                    Image("anh1")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 260)
                        .clipped()
                        .shadow(radius: 5)

                    Image("anh2")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        .offset(y: 60)
                }

                
                Spacer().frame(height: 70)
                
              
                Text("Nguyễn Hải Hoài")
                    .font(.system(size: 26, weight: .semibold))
                
                Button(action: {}) {
                    HStack(spacing: 6) {
                        Image(systemName: "square.and.pencil")
                        Text("Cập nhật giới thiệu bản thân")
                    }
                    .font(.system(size: 15))
                }
                .padding(.top, 4)
                
           
                HStack(spacing: 14) {
                    ZaloMenuItem(icon: "person.2.fill", title: "Cài zStyle")
                    ZaloMenuItem(icon: "photo.on.rectangle", title: "Ảnh của tôi")
                    ZaloMenuItem(icon: "archivebox.fill", title: "Kho khoảnh khắc")
                }
                .padding(.top, 10)
                .padding(.horizontal)
                
               
                VStack(spacing: 12) {
                    Image("anh3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 140)
                    
                    Text("Hôm nay Nguyễn Hải Hoài có gì vui?")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.top, 8)
                    
                    Text("Đây là Nhật ký của bạn – Hãy làm đầy Nhật ký với những dấu ấn cuộc đời và kỷ niệm đáng nhớ nhé!")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Text ("Đăng lên nhật ký")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
        .background(Color(.systemGray6))
    }
}


struct ZaloMenuItem: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 55, height: 55)
                .background(Color.white)
                .cornerRadius(14)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            
            Text(title)
                .font(.system(size: 14))
        }
    }
}

struct ZaloProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZaloProfileView()
    }
}
