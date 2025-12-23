import SwiftUI

struct ViewProfile: View {
    @StateObject var vm = UserViewModel()
    @State private var goToSettings = false

    var body: some View {
        VStack {
            HeaderView(bellState: .canhan, onTapSettings: {
                goToSettings = true
            })

            UserItemView(
                avatar: "anh1",
                name: "Nguyen Quang Huy",
                subname: "@nguyenquanghuy",
                icon: "gearshape.fill"
            )

            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .foregroundColor(.gray)
                .opacity(0.3)

            ItemProfileView(avatar: "icloud", text: "zCloud", subntext: "Không gian lưu trữ dữ liệu đám mây", icon: "chevron.right")
            ItemProfileView(isshow: false, avatar: "icloud", text: "zStyle- Nổi bật trên Zalo", subntext: "Hình nền và nhạc cho cuộc gọi Zalo", icon: "chevron.right")

            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .foregroundColor(.gray)
                .opacity(0.3)

            ItemProfileView(avatar: "icloud", text: "Cloud của tôi", subntext: "Lưu trữ các tin nhắn quan trọng", icon: "chevron.right")
            ItemProfileView(avatar: "icloud", text: "Dữ liệu trên máy", subntext: "Quản lý dữ liệu Zalo của bạn", icon: "chevron.right")
            ItemProfileView(isshow: false, avatar: "icloud", text: "Ví QR", subntext: "Lưu trữ và xuất trình các mã QR quan trọng", icon: "chevron.right")

            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 10)
                .foregroundColor(.gray)
                .opacity(0.3)

            ItemProfileView(avatar: "icloud", text: "Tài khoản và bảo mật", icon: "chevron.right")
            ItemProfileView(avatar: "icloud", text: "Quyền riêng tư", icon: "chevron.right")

            Spacer()
        }
        // ✅ đặt ở container cha (VStack), KHÔNG gắn lên HeaderView
        .navigationDestination(isPresented: $goToSettings) {
            ZaloSettingView()
        }
        .onAppear {
            Task {
                await vm.getUser(id: "6936c7d32f6fcb4f8ad07132")
            }
        }
    }
}

#Preview {
    NavigationStack {
        ViewProfile()
    }
}

