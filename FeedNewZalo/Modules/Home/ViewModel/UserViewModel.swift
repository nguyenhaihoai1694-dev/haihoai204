//
//  UserViewModel.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

import Combine
import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: UserResponse?
    @Published var story: StoryModel?
    @Published var errorMessage: String?
    
   
    func getStory(id : Int) async {
        do {
            story = try await HomeService.shared.getStory(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func getUser(id : String) async {
        do {
            user = try await HomeService.shared.getUser(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
}
