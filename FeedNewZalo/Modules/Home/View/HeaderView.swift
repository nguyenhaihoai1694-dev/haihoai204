import SwiftUI

enum DisplayState {
    case tuongnha
    case canhan
    case none
}

struct HeaderView: View {
   
    var bellState: DisplayState = .none
    //// call back goi nguoc
    var onTapPencil: (() -> Void)?
    var onTapBell: (() -> Void)?
    var onTapSettings: (() -> Void)?
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title)
                .foregroundColor(.white)
                
            TextField("Tìm Kiếm", text: .constant("Tìm Kiếm"))
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding()
           
            if bellState == .tuongnha {
                Image(systemName: "square.and.pencil")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 50)
                    .onTapGesture {
                        onTapPencil?()
                    }
                
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bell")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 35)
                    
                    Text("1")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: 5, y: -10)
                }
                .onTapGesture {
                    onTapBell?()
                }
            }
            
            if bellState == .canhan {
                Image(systemName: "gearshape.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 50)
                    .onTapGesture {
                        print("oke")
                        onTapSettings?()
                    }
            }
        }
        .padding(.horizontal, 16)
        .background(Color(.systemBlue))
    }
}


