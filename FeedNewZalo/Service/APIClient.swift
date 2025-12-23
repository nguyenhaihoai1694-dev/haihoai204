//
//  APIClient.swift
//  FeedNewZalo
//
//  Created by Admin on 4/12/25.
//

import Alamofire
import Foundation

class APIClient {
    
    static let shared = APIClient()
    private init() {}
    
    func request<T: Decodable>(
        _ endpoint: APIEndpoint,
        type: T.Type
    ) async throws -> T {
        
        let url = endpoint.baseURL + endpoint.path
        
        print(url)
        
        return try await withCheckedThrowingContinuation { continuation in
            
            AF.request(
                url,
                method: endpoint.method,
                parameters: endpoint.parameters,
                encoding: endpoint.encoding,
                headers: endpoint.headers
            )
            .validate()
            .responseDecodable(of: T.self) { response in
                
                
                switch response.result {
                case .success(let value):
                    print(value)
                    continuation.resume(returning: value)
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

