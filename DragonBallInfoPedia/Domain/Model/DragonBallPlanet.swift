//
//  DragonBallPlanet.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

struct DragonBallPlanet: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let isDestroyed: Bool
    let characters: [DragonBallCharacter]?

    init(
        id: Int,
        name: String,
        description: String,
        image: String,
        isDestroyed: Bool,
        characters: [DragonBallCharacter]? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.isDestroyed = isDestroyed
        self.characters = characters
    }
}
