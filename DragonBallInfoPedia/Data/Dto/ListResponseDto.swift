//
//  ListResponseDto.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation

struct ListResponseDto<T: Codable> : Codable {
    let items: [T]
}
