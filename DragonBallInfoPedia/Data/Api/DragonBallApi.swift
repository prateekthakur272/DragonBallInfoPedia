//
//  DragonBallApi.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

struct DragonBallApi {
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getCharacters(page: Int = 1, limit: Int = 20) async throws -> ListResponseDto<DragonBallCharacter> {
        let url = "\(baseUrl)/characters"
        let params = ["page": "\(page)", "limit": "\(limit)"]
        let response = try await HttpClient.shared.fetch(type: ListResponseDto<DragonBallCharacter>.self, url: url, queryParams: params)
        return response
    }
    
    func getPlanets(page: Int = 1, limit: Int = 20) async throws -> ListResponseDto<DragonBallPlanet> {
        let url = "\(baseUrl)/planets"
        let params = ["page": "\(page)", "limit": "\(limit)"]
        let response = try await HttpClient.shared.fetch(type: ListResponseDto<DragonBallPlanet>.self, url: url, queryParams: params)
        return response
    }
    
    func getPlanetDetails(id: Int) async throws -> DragonBallPlanet {
        let url = "\(baseUrl)/planets/\(id)"
        let response = try await HttpClient.shared.fetch(type: DragonBallPlanet.self, url: url)
        return response
    }
    
    func getCharacterDetails(id: Int) async throws -> DragonBallCharacterDetails {
        let url = "\(baseUrl)/characters/\(id)"
        let response = try await HttpClient.shared.fetch(type: DragonBallCharacterDetails.self, url: url)
        return response
    }
}
