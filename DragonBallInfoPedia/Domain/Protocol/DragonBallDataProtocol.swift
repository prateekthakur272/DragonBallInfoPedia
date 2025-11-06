//
//  DragonBallDataProtocol.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

protocol DragonBallDataProtocol {
    func getPlanets(page: Int, limit: Int) async throws -> [DragonBallPlanet]
    func getCharacters(page: Int, limit: Int) async throws -> [DragonBallCharacter]
    func getCharacter(id: Int) async throws -> DragonBallCharacterDetails
    func getPlanet(id: Int) async throws -> DragonBallPlanet
}
