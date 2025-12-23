//
//  StoryModel.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

import Foundation

struct StoryModel: Codable, Sendable, Identifiable {
    var id: UUID = UUID()     // tự tạo ID vì JSON không có
    let stories: [StoryItem]
}

struct StoryItem: Codable, Sendable, Identifiable {
    let id: Int
    let name: String?
    let image: String?
    let avatar: String?
    let isCreate: Bool?
}

