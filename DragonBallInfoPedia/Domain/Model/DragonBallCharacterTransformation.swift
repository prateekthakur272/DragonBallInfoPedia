//
//  DragonBallCharacterTransformation.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

struct DragonBallCharacterTransformation: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let image: String?
    let ki: String
    let deletedAt: String?

    init(
        id: Int,
        name: String,
        image: String? = nil,
        ki: String,
        deletedAt: String? = nil
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.ki = ki
        self.deletedAt = deletedAt
    }
}
