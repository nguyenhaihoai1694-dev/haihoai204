import SwiftUI

// MARK: - Destination
// toi code o day

enum SettingDestination: Hashable {
    case accountSecurity
    case privacy
    case dataOnDevice
    case backupRestore
    case notifications
    case messages
    case CallSettingView
    case activityLog
    case contacts
    case appearanceLanguage
    case aboutZalo
    case support
    case switchAccount
}

// MARK: - Models

struct SettingItem: Identifiable, Hashable {
    let id: String
    let icon: String
    let title: String
    let destination: SettingDestination?

    init(icon: String, title: String, destination: SettingDestination?) {
        self.id = "\(icon)-\(title)"
        self.icon = icon
        self.title = title
        self.destination = destination
    }
}

struct SettingSection: Identifiable {
    let id = UUID()
    let items: [SettingItem]
}

// MARK: - Components

struct SectionSeparator: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 0.90, green: 0.90, blue: 0.90))
            .frame(height: 10)
            .frame(maxWidth: .infinity)
    }
}

struct SettingHeader: View { // tại sao SettingHeader??
    let onBack: () -> Void

    var body: some View {
        HStack {
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .contentShape(Rectangle())
            }

            Spacer()

            Text("Cài đặt")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)

            Spacer()

            Image(systemName: "magnifyingglass")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [.blue.opacity(0.9), .blue],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

struct SettingRow: View {
    let item: SettingItem
    let showDivider: Bool

    @ViewBuilder
    var body: some View {
        if let dest = item.destination {
            // ✅ chỉ 1 cơ chế điều hướng
            NavigationLink(value: dest) {
                rowContent
            }
            .buttonStyle(.plain)
        } else {
            rowContent
        }

        if showDivider {
            Divider().padding(.leading, 56)
        }
    }

    private var rowContent: some View {
        HStack(spacing: 12) {
            Image(systemName: item.icon)
                .font(.system(size: 22))
                .foregroundColor(.blue)
                .frame(width: 28)

            Text(item.title)
                .font(.system(size: 17))
                .foregroundColor(.black)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}

// MARK: - Main View

struct ZaloSettingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showLogoutConfirm = false

    private let sections: [SettingSection] = [
        SettingSection(items: [
            SettingItem(icon: "shield.fill", title: "Tài khoản và bảo mật", destination: .accountSecurity),
            SettingItem(icon: "lock.fill", title: "Quyền riêng tư", destination: .privacy),
        ]),
        SettingSection(items: [
            SettingItem(icon: "clock.fill", title: "Dữ liệu trên máy", destination: .dataOnDevice),
            SettingItem(icon: "arrow.clockwise", title: "Sao lưu và khôi phục", destination: .backupRestore),
        ]),
        SettingSection(items: [
            SettingItem(icon: "bell.fill", title: "Thông báo", destination: .notifications),
            SettingItem(icon: "message.fill", title: "Tin nhắn", destination: .messages),
            SettingItem(icon: "phone.fill", title: "Cuộc gọi", destination: .CallSettingView),
        ]),
        SettingSection(items: [
            SettingItem(icon: "clock.arrow.circlepath", title: "Nhật ký", destination: .activityLog),
            SettingItem(icon: "person.crop.square", title: "Danh bạ", destination: .contacts),
            SettingItem(icon: "paintbrush.fill", title: "Giao diện và ngôn ngữ", destination: .appearanceLanguage),
        ]),
        SettingSection(items: [
            SettingItem(icon: "info.circle.fill", title: "Thông tin về Zalo", destination: .aboutZalo),
            SettingItem(icon: "questionmark.circle", title: "Liên hệ hỗ trợ", destination: .support),
            SettingItem(icon: "arrow.left.arrow.right.circle", title: "Chuyển đổi tài khoản", destination: .switchAccount),
        ]),
    ]

    var body: some View {
        VStack(spacing: 0) {
            SettingHeader(onBack: { dismiss() })

            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {

                    ForEach(Array(sections.enumerated()), id: \.element.id) { sectionIndex, section in
                        VStack(spacing: 0) {
                            ForEach(Array(section.items.enumerated()), id: \.element.id) { rowIndex, item in
                                SettingRow(
                                    item: item,
                                    showDivider: rowIndex < section.items.count - 1
                                )
                            }
                        }

                        if sectionIndex < sections.count - 1 {
                            SectionSeparator()
                        }
                    }

                    SectionSeparator()

                    Button {
                        showLogoutConfirm = true
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))

                            Text("Đăng xuất")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(100)
                        .padding()
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .background(Color.white.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(for: SettingDestination.self) { dest in
            switch dest {
            case .accountSecurity:
                AccountSecurityView()
            case .privacy:
                PrivacyView()
            case .notifications:
                NotificationSettingView()
            case .dataOnDevice:
                Text("Dữ liệu trên máy").font(.title2)
            case .backupRestore:
                Text("Sao lưu và khôi phục").font(.title2)
            case .messages:
                Text("Tin nhắn").font(.title2)
            case .CallSettingView:
                Text("Cuộc gọi").font(.title2)
            case .activityLog:
                Text("Nhật ký").font(.title2)
            case .contacts:
                Text("Danh bạ").font(.title2)
            case .appearanceLanguage:
                Text("Giao diện và ngôn ngữ").font(.title2)
            case .aboutZalo:
                Text("Thông tin về Zalo").font(.title2)
            case .support:
                Text("Liên hệ hỗ trợ").font(.title2)
            case .switchAccount:
                Text("Chuyển đổi tài khoản").font(.title2)
            }
        }
        .alert("Đăng xuất?", isPresented: $showLogoutConfirm) {
            Button("Hủy", role: .cancel) {}
            Button("Đăng xuất", role: .destructive) {
                // TODO: logout
            }
        } message: {
            Text("Bạn có chắc muốn đăng xuất không?")
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ZaloSettingView()
    }
}

