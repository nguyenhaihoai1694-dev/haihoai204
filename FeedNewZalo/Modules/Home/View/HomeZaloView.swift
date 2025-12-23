//
//  Untitled.swift
//  FeedNewZalo
//
//  Created by Admin on 2/12/25.
//

import SwiftUI

struct HomeZaloView: View {
    @StateObject var vm = UserViewModel()
    
    var body: some View {
        VStack {
            HeaderView(bellState: .tuongnha)
           
            
            CustomTabView()

            Spacer()
            }
       
            
        }
    
}

