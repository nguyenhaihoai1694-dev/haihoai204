import SwiftUI

struct ZaloTabView: View {
    var body: some View {
        TabView {

            NavigationStack {
                ChatView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .tabItem {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Tin nhắn")
            }

            NavigationStack {
                HomeZaloView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .tabItem {
                Image(systemName: "bubble.left.fill")
                Text("Tường Nhà")
            }

            NavigationStack {
                ViewProfile()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Cá nhân")
            }
        }
    }
}

#Preview {
    ZaloTabView()
}

