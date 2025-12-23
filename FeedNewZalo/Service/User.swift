//
//  User.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

import Foundation

struct UserResponse: Decodable {
    let status: Int
    let message: String
    let data: UserData
}

struct UserData: Codable, Sendable, Identifiable {
    var id: UUID = UUID()
    let _id: String?
    let name: String?
    let email: String?
    let password: String?
    let avatar: String?
    let role: String?
    let createdAt: String?
}


