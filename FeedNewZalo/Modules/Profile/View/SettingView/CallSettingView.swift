//
//  CallSettingView.swift
//  FeedNewZalo
//
//  Created by Admin on 18/12/25.
//
import SwiftUI

struct CallSettingView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var minimizeVideo = true
    @State private var showCallHistory = true

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Header
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .onTapGesture { dismiss() }

                Text("Cuộc gọi")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)

                Spacer()
            }
            .padding()
            .background(Color.blue)

            ScrollView {
                VStack(spacing: 20) {

                    // MARK: - Âm thanh & Hình nền
                    sectionTitle("Âm thanh & Hình nền")
                    VStack(spacing: 0) {
                        arrowValueRow(
                            title: "Nhạc chuông",
                            value: "Theo nhạc chuông hệ thống"
                        )
                        divider()

                        arrowValueRow(
                            title: "Nhạc chờ",
                            value: "Zalo (mặc định)"
                        )
                        divider()

                        arrowValueRow(
                            title: "Hình chờ",
                            value: "Zalo (mặc định)"
                        )
                    }
                    .cardStyle()

                    // MARK: - Tùy chọn
                    sectionTitle("Tùy chọn")
                    VStack(spacing: 0) {
                        toggleRow(
                            title: "Thu nhỏ màn hình khi gọi video",
                            subtitle: "Giữ cho video tiếp tục ngay cả khi thoát app",
                            isOn: $minimizeVideo
                        )
                        divider()

                        toggleRow(
                            title: "Hiện lịch sử gọi Zalo trên điện thoại",
                            subtitle: "Gọi lại nhanh và miễn phí bằng Zalo",
                            isOn: $showCallHistory
                        )
                    }
                    .cardStyle()

                    // MARK: - Quyền riêng tư
                    sectionTitle("Quyền riêng tư")
                    VStack(spacing: 0) {
                        arrowValueRow(
                            title: "Cho phép gọi điện",
                            value: "Bạn bè và người lạ từng liên hệ"
                        )
                        divider()

                        arrowRow(title: "Chặn cuộc gọi")
                    }
                    .cardStyle()
                }
                .padding()
                .background(Color(.systemGroupedBackground))
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Components

    func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func arrowRow(title: String) -> some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }

    func arrowValueRow(title: String, value: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Text(value)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }

    func toggleRow(
        title: String,
        subtitle: String,
        isOn: Binding<Bool>
    ) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Toggle("", isOn: isOn)
                    .labelsHidden()
            }
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }

    func divider() -> some View {
        Divider().padding(.leading, 16)
    }
}

extension View {
    func cardStyle(
        cornerRadius: CGFloat = 12,
        background: Color = .white
    ) -> some View {
        self
            .background(background)
            .cornerRadius(cornerRadius)
    }
}


#Preview {
    CallSettingView()
}
