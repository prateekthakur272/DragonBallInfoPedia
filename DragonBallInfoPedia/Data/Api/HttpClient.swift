//
//  HttpClient.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

final class HttpClient {
    
    private let decoder = JSONDecoder()
    static let shared = HttpClient()
    private init() {}
    
    func fetch<T: Decodable>(type: T.Type, url: String, queryParams: [String: String]? = nil) async throws -> T {
        
        guard var components = URLComponents(string: url) else { throw URLError(.badURL) }
        
        if let queryParams = queryParams {
            components.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
