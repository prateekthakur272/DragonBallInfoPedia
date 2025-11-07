//
//  CharacterDetailsViewModel.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 07/11/25.
//

import Foundation
import Combine

class CharacterDetailsViewModel: ObservableObject {
    
    @Published var character: DragonBallCharacterDetails? = nil
    
    private let repository: DragonBallDataProtocol = DragonBallDataRepository()
    
    init(id: Int) {
        Task{
            await getDetails(id: id)
        }
    }
    
    private func getDetails(id: Int) async {
        do {
            character = try await repository.getCharacter(id: id)
        }catch {
            character = nil
        }
    }
}
