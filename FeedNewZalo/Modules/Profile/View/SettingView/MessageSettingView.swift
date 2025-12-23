//
//  MessageSettingView.swift
//  FeedNewZalo
//
//  Created by Admin on 18/12/25.
//

import SwiftUI

struct MessageSettingView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var suggestSticker = true
    @State private var reaction = true
    @State private var autoVoice = false

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Header
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .onTapGesture { dismiss() }

                Text("Tin nhắn")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)

                Spacer()
            }
            .padding()
            .background(Color.blue)

            ScrollView {
                VStack(spacing: 20) {

                    // MARK: - Tiện ích
                    sectionTitle("Tiện ích")
                    VStack(spacing: 0) {
                        arrowRow(title: "Quản lý tin nhắn nhanh")
                        divider()
                        betaRow(title: "Phân loại trò chuyện")
                        divider()
                        toggleRow(
                            title: "Gợi ý Sticker khi soạn tin nhắn",
                            isOn: $suggestSticker
                        )
                    }
                    .cardStyle()

                    // MARK: - Quyền riêng tư
                    sectionTitle("Quyền riêng tư")
                    VStack(spacing: 0) {
                        arrowRow(title: "Chặn tin nhắn")
                        divider()
                        arrowRow(title: "Ẩn trò chuyện")
                    }
                    .cardStyle()

                    // MARK: - Tùy chọn
                    sectionTitle("Tùy chọn")
                    VStack(spacing: 0) {
                        toggleRow(
                            title: "Thả biểu tượng cảm xúc",
                            subtitle: "Hiện nút thả biểu tượng cảm xúc trong trò chuyện",
                            isOn: $reaction
                        )
                        divider()
                        toggleRow(
                            title: "Tự động phát tin nhắn thoại",
                            isOn: $autoVoice
                        )
                        divider()
                        arrowValueRow(
                            title: "Tự động phát video",
                            value: "Luôn tự động phát"
                        )
                        divider()
                        arrowValueRow(
                            title: "Tự động tải về",
                            value: "Đang bật",
                            subtitle: "Thay bạn tải video và file mới về máy"
                        )
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

    func betaRow(title: String) -> some View {
        HStack {
            Text(title)
            Text("BETA")
                .font(.caption2)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(6)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }

    func toggleRow(
        title: String,
        subtitle: String? = nil,
        isOn: Binding<Bool>
    ) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Toggle("", isOn: isOn)
                    .labelsHidden()
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }

    func arrowValueRow(
        title: String,
        value: String,
        subtitle: String? = nil
    ) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Text(value)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }

    func divider() -> some View {
        Divider().padding(.leading, 16)
    }
}

#Preview {
    MessageSettingView()
}
