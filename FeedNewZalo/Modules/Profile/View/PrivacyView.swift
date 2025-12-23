import SwiftUI

struct PrivacyView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {

            // Header
            HStack(spacing: 10) {
                Button {
                    dismiss() // ✅ pop đúng 1 màn
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                }

                Text("Quyền riêng tư")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)

                Spacer()
            }
            .padding(.horizontal, 12)
            .background(Color.blue)

            ScrollView {
                VStack(spacing: 20) {

                    sectionTitle("Cá nhân")
                    VStack(spacing: 0) {
                        row(icon: "calendar", title: "Sinh nhật")
                        divider()
                        row(icon: "person.circle", title: "Hiện trạng thái truy cập", value: "Đang tắt")
                    }
                    .zaloCardStyle()

                    sectionTitle("Tin nhắn và cuộc gọi")
                    VStack(spacing: 0) {
                        row(icon: "checkmark.message", title: "Hiện trạng thái \"Đã xem\"", value: "Đang tắt")
                        divider()
                        row(icon: "message", title: "Cho phép nhắn tin", value: "Mọi người")
                        divider()
                        row(icon: "phone", title: "Cho phép gọi điện", value: "Bạn bè và người lạ từng liên hệ")
                    }
                    .zaloCardStyle()

                    sectionTitle("Nhật ký")
                    VStack(spacing: 0) {
                        row(icon: "pencil", title: "Cho phép xem và bình luận")
                        divider()
                        row(icon: "nosign", title: "Chặn và ẩn")
                    }
                    .zaloCardStyle()

                    sectionTitle("Nguồn tìm kiếm và kết bạn")
                    VStack(spacing: 0) {
                        row(icon: "person.badge.plus", title: "Quản lý nguồn tìm kiếm và kết bạn")
                    }
                    .zaloCardStyle()

                    sectionTitle("Quyền của tiện ích")
                    VStack(spacing: 0) {
                        row(icon: "square.grid.2x2", title: "Tiện ích")
                    }
                    .zaloCardStyle()
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }

    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func row(icon: String, title: String, value: String? = nil) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 24)

            Text(title)

            Spacer()

            if let value {
                Text(value)
                    .foregroundColor(.gray)
            }

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }

    private func divider() -> some View {
        Divider().padding(.leading, 52)
    }
}

private extension View {
    func zaloCardStyle() -> some View {
        self
            .background(Color.white)
            .cornerRadius(12)
    }
}

#Preview {
    NavigationStack {
        PrivacyView()
    }
}

