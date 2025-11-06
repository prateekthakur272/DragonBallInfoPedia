//
//  DragonBallDataRepository.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

struct DragonBallDataRepository: DragonBallDataProtocol {
    
    private let api = DragonBallApi(baseUrl: "https://api.dragonball.com")
    
    func getPlanets(page: Int, limit: Int) async throws -> [DragonBallPlanet] {
        return (try await api.getPlanets(page: page, limit: limit)).items
    }
    
    func getCharacters(page: Int, limit: Int) async throws -> [DragonBallCharacter] {
        return (try await api.getCharacters(page: page, limit: limit)).items
    }
    
    func getCharacter(id: Int) async throws -> DragonBallCharacterDetails {
        return try await api.getCharacterDetails(id: id)
    }
    
    func getPlanet(id: Int) async throws -> DragonBallPlanet {
        return try await api.getPlanetDetails(id: id)
    }
}
