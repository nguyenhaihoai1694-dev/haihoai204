//
//  Contenview.swift
//  FeedNewZalo
//
//  Created by Admin on 21/12/25.
//

import SwiftUI

struct ContentView: View {

    @StateObject var store = StoreMaager()

    var body: some View {
        VStack(spacing: 20) {

            ForEach(store.products) { product in
                Button("Mua \(product.displayName)") {
                    Task {
                        await store.purchase(product)
                    }
                }
            }

            Button("Restore Purchase") {
                Task {
                    await store.restore()
                }
            }
        }
        .task {
            await store.loadProducts()
        }
    }
}
#Preview {
    ContentView()
}
