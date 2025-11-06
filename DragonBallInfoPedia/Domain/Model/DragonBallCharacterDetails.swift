//
//  DragonBallCharacterDetails.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

struct DragonBallCharacterDetails: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String?
    let gender: String?
    let description: String?
    let image: String?
    let affiliation: String?
    let deletedAt: String?
    let originPlanet: DragonBallPlanet?
    let transformations: [DragonBallCharacterTransformation]

    init(
        id: Int,
        name: String,
        ki: String,
        maxKi: String,
        race: String? = nil,
        gender: String? = nil,
        description: String? = nil,
        image: String? = nil,
        affiliation: String? = nil,
        deletedAt: String? = nil,
        originPlanet: DragonBallPlanet? = nil,
        transformations: [DragonBallCharacterTransformation] = []
    ) {
        self.id = id
        self.name = name
        self.ki = ki
        self.maxKi = maxKi
        self.race = race
        self.gender = gender
        self.description = description
        self.image = image
        self.affiliation = affiliation
        self.deletedAt = deletedAt
        self.originPlanet = originPlanet
        self.transformations = transformations
    }
}
