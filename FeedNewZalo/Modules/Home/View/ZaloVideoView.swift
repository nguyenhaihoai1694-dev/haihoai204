import SwiftUI
import AVKit
import PhotosUI
import UniformTypeIdentifiers

struct ZaloVideoView: View {

    // Demo video trong Bundle
    let demoVideoNames: [String] = ["video1", "video2", "video3"]

    @State private var player: AVPlayer? = nil
    @State private var isPresentingPlayer = false
    @State private var pickedItem: PhotosPickerItem? = nil
    @State private var pickedVideoURL: URL? = nil

    let columns = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.blue)

                        Text("Zalo Video")
                            .font(.title2.bold())
                    }
                    .padding(.horizontal)

                    // MARK: - Header
                    Text("Gợi ý cho bạn")
                        .font(.title3.italic())
                        .padding(.horizontal)

                    // MARK: - Gợi ý giống Zalo
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 14) {
                            ForEach(demoVideoNames, id: \.self) { name in
                                ZaloVideoCard(title: name) {
                                    playDemoVideo(name: name)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Divider().padding(.horizontal)

                    // MARK: - Video Picker
                    VStack(spacing: 10) {
                        Text("Hoặc chọn video từ Thư viện")
                            .font(.headline)

                        PhotosPicker(
                            selection: $pickedItem,
                            matching: .videos
                        ) {
                            HStack {
                                Image(systemName: "photo.on.rectangle.angled")
                                Text("Chọn video")
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 18)
                            .background(Color.blue.opacity(0.15))
                            .cornerRadius(10)
                        }
                        .onChange(of: pickedItem) { item in
                            guard let item = item else { return }
                            loadVideoFromPicker(item: item)
                        }

                        if let url = pickedVideoURL {
                            Button("Phát video đã chọn") {
                                play(url: url)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.top, 8)
            }
            .fullScreenCover(isPresented: $isPresentingPlayer) {
                if let player = player {
                    VideoPlayerView(player: player)
                }
            }
        }
    }

    // MARK: - Play demo video trong Bundle
    private func playDemoVideo(name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "mp4") {
            play(url: URL(fileURLWithPath: path))
        }
    }

    // MARK: - Play video
    private func play(url: URL) {
        let av = AVPlayer(url: url)
        self.player = av
        self.isPresentingPlayer = true
        av.play()
    }

    // MARK: - Load video từ PhotosPicker
    private func loadVideoFromPicker(item: PhotosPickerItem) {
        Task {
            do {
                guard let data = try await item.loadTransferable(type: Data.self) else {
                    print("Không load được video")
                    return
                }

                let ext = item.supportedContentTypes.first?.preferredFilenameExtension ?? "mov"
                let filename = UUID().uuidString + ".\(ext)"
                let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent(filename)

                try data.write(to: tmpURL)

                await MainActor.run {
                    self.pickedVideoURL = tmpURL
                }

            } catch {
                print("Lỗi load video:", error)
            }
        }
    }
}

//
// MARK: - Card UI giống Zalo
//
struct ZaloVideoCard: View {
    let title: String
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 150, height: 260)
                    .shadow(radius: 3)

                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .onTapGesture { onTap() }

            Text(title)
                .font(.caption)
                .lineLimit(1)
                .foregroundColor(.black)
        }
    }
}

//
// MARK: - Fullscreen Player giống Zalo
//
    struct VideoPlayerView: View {
    @Environment(\.dismiss) var dismiss
    let player: AVPlayer

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)

            Button {
                player.pause()
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .padding(10)
            }
        }
    }
}
