//
//  AccountView.swift
//  FeedNewZalo
//
//  Created by Admin on 13/12/25.
//

import SwiftUI

struct AccountSecurityView: View {
    @State private var twoFactor = false // Bật / tắt Bảo mật 2 lớp
    @Environment(\.dismiss) private var dismiss
    

    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Text("Quyền riêng tư")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()

                }
                .padding(.horizontal, 12)
                .padding(.top, 8)
                .background(Color.blue)
                
                ScrollView {
                    VStack(spacing: 20) {

                        // MARK: - Tài khoản
                        sectionTitle("Tài khoản")

                        VStack(spacing: 0) {
                            profileRow()
                            divider()

                            row(icon: "phone", title: "Số điện thoại", value: "(+84) 385 295 853")
                            divider()

                            row(icon: "envelope", title: "Email", value: "Chưa liên kết")
                            divider()

                            verifiedRow()
                            divider()

                            row(icon: "qrcode", title: "Mã QR của tôi")
                        }
                        .background(Color.white)
                        .cornerRadius(12)

                        // MARK: - Bảo mật
                        sectionTitle("Bảo mật")

                        VStack(spacing: 0) {
                            warningRow()
                            divider()

                            row(icon: "lock.keyboard", title: "Khoá Zalo", value: "Đang tắt")
                        }
                        .background(Color.white)
                        .cornerRadius(12)

                        // MARK: - Đăng nhập
                        sectionTitle("Đăng nhập")

                        VStack(spacing: 0) {
                            row(icon: "lock", title: "Mật khẩu")
                            divider()

                            row(icon: "iphone", title: "Thiết bị đăng nhập")
                            divider()

                            Toggle(isOn: $twoFactor) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Bảo mật 2 lớp")
                                    Text("Thêm hình thức xác nhận để bảo vệ tài khoản")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(12)

                        // MARK: - Xoá tài khoản
                        VStack {
                            HStack {
                                Text("Xoá tài khoản")
                                    .foregroundColor(.red)
                                    .font(.system(size: 17, weight: .semibold))

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                    .padding()
                    .background(Color(.systemGroupedBackground))
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // MARK: - Components

    func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    func row(icon: String, title: String, value: String? = nil) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 24)

            Text(title)

            Spacer()

            if let value = value {
                Text(value)
                    .foregroundColor(.gray)
            }

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }

    func profileRow() -> some View {
        HStack {
            Image("anh1")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("Thông tin cá nhân")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Nguyễn Hải Hoài")
                    .font(.headline)
            }

            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }

    func verifiedRow() -> some View {
        HStack {
            Image(systemName: "person.badge.checkmark")
                .foregroundColor(.gray)
                .frame(width: 24)

            Text("Định danh tài khoản")

            Spacer()

            Label("Đã định danh", systemImage: "checkmark.circle.fill")
                .foregroundColor(.green)

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }

    func warningRow() -> some View {
        HStack {
            Image(systemName: "shield")
                .foregroundColor(.gray)
                .frame(width: 24)

            VStack(alignment: .leading) {
                Text("Kiểm tra bảo mật")
                Text("3 vấn đề bảo mật cần xử lý")
                    .foregroundColor(.orange)
            }

            Spacer()
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)
        }
        .padding()
    }

    func divider() -> some View {
        Divider().padding(.leading, 52)
    }
    
}

#Preview {
    AccountSecurityView()
}
