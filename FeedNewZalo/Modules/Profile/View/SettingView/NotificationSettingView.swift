//
//  NotificationSettingView.swift
//  FeedNewZalo
//
//  Created by Admin on 17/12/25.
//

import SwiftUI

struct NotificationSettingView: View {
    @Environment(\.dismiss) private var dismiss

    // MARK: - State
    @State private var previewNotify = true
    @State private var vibrateNotify = true
    @State private var notifyPrivateChat = true
    @State private var previewPrivateChat = true
    @State private var notifyCall = true
    @State private var birthdayNotify = true
    @State private var soundNotify = false

    var body: some View {
        NavigationStack {
            List {

                // MARK: - Trò chuyện 2 người
                Section(header: sectionTitle("Trò chuyện 2 người")) {
                    Toggle("Báo tin nhắn mới từ trò chuyện 2 người",
                           isOn: $notifyPrivateChat)

                    Toggle("Xem trước tin nhắn từ trò chuyện 2 người",
                           isOn: $previewPrivateChat)
                }

                // MARK: - Trò chuyện nhóm
                Section(header: sectionTitle("Trò chuyện nhóm")) {
                    NavigationLink {
                        Text("Cài đặt thông báo nhóm")
                    } label: {
                        HStack {
                            Text("Báo tin nhắn mới từ nhóm")
                            Spacer()
                            Text("Đang bật")
                                .foregroundColor(.gray)
                        }
                    }
                }

                // MARK: - Cuộc gọi
                Section(header: sectionTitle("Cuộc gọi")) {
                    Toggle("Báo cuộc gọi đến",
                           isOn: $notifyCall)

                    NavigationLink {
                        Text("Danh sách bạn bè bị tắt thông báo")
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Tắt thông báo cuộc gọi từ bạn bè")
                            Text("0 người")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }

                // MARK: - Nhật ký
                Section(header: sectionTitle("Nhật ký")) {
                    NavigationLink {
                        Text("Cài đặt nhật ký")
                    } label: {
                        HStack {
                            Text("Báo hoạt động mới của bạn bè")
                            Spacer()
                            Text("Đang bật")
                                .foregroundColor(.gray)
                        }
                    }
                }

                // MARK: - Sự kiện
                Section(header: sectionTitle("Sự kiện")) {
                    Toggle(isOn: $birthdayNotify) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Báo cho tôi về sinh nhật của bạn bè")
                            Text("Bao gồm thông báo đẩy và thông báo trong trò chuyện")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }

                // MARK: - Thông báo trong Zalo
                Section(
                    header: Text("Thông báo trong Zalo")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.blue)
                        .textCase(nil)
                ) {

                    Toggle("Phát âm báo tin nhắn mới trong Zalo",
                           isOn: $soundNotify)

                    Toggle("Rung khi có tin nhắn mới trong Zalo",
                           isOn: $vibrateNotify)

                    Toggle("Xem trước tin nhắn mới trong Zalo",
                           isOn: $previewNotify)
                }

            }
            .listStyle(.insetGrouped) // QUAN TRỌNG – giống Zalo
            .navigationTitle("Thông báo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Section Header Style
    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.blue)
            .textCase(nil)
    }
}
#Preview {
    NotificationSettingView()
}

