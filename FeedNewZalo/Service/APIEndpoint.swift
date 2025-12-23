//
//  APIEndpoint.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

import Alamofire

enum APIEndpoint {
    case getUser(id: String)
    case createUser(name: String)
    case getStory(id: Int)
    
    var baseURL: String {
        return "http://localhost:3000/api"
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/getUser"
        case .createUser:
            return "/users"
        case .getStory(id: let id):
            return "/getstory/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .post
        case .createUser:
            return .post
        case .getStory:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getUser(let id):
            return ["id": id]
            
        case .createUser(let name):
            return ["name": name]
        case .getStory:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getUser:
            return JSONEncoding.default
        case .createUser:
            return JSONEncoding.default
        case .getStory:
            return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders {
        [
            "Content-Type": "application/json"
        ]
    }
}
