//
//  APIError.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case noData
    case decodingFailed
    case serverError(String)
}
