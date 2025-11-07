//
//  CharacterViewModel.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import Foundation
import Combine

@MainActor
final class CharacterViewModel : ObservableObject {
    
    @Published var characters: [DragonBallCharacter] = []
    @Published var currentPage: Int = 1
    @Published var defaultLimit: Int = 20
    
    private let repository: DragonBallDataProtocol = DragonBallDataRepository()
    
    func getCharacters(page: Int = 1, limit: Int = 10) async {
        do{
            characters += try await repository.getCharacters(page: page, limit: limit)
        }catch {
            characters = []
        }
    }
    
    func nextPage() async {
        currentPage+=1
        await getCharacters(page: currentPage)
    }
}
