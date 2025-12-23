//
//  UserService.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

class HomeService {
    
    static let shared = HomeService()

    func getUser(id: String) async throws -> UserResponse {
        try await APIClient.shared.request(.getUser(id: id), type: UserResponse.self)
    }
    
    func getStory(id : Int) async throws -> StoryModel {
        try await APIClient.shared.request(.getStory(id: id), type: StoryModel.self)
    }
}
