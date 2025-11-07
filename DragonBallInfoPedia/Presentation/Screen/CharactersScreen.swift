//
//  CharactersScreen.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import SwiftUI

struct CharactersScreen: View {
    
    @StateObject var viewModel: CharacterViewModel
    @State var selectedCharacter: DragonBallCharacter? = nil
    
    var body : some View {
        NavigationStack{
            List(viewModel.characters){ character in
                Button{
                    selectedCharacter = character
                } label: {
                    CharacterCardView(character: character)
                }.buttonStyle(.plain)
                .onAppear{
                    if character == viewModel.characters.last {
                        Task{
                            await viewModel.nextPage()
                        }
                    }
                }
            }.navigationTitle("Characters").task {
                await viewModel.getCharacters()
            }.navigationDestination(item: $selectedCharacter) { character in
                CharacterDetailsScreen(viewModel: CharacterDetailsViewModel(id: character.id))
            }
        }
    }
}

struct CharacterCardView: View {
    let character: DragonBallCharacter
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 480)
            .frame(maxWidth: .infinity)
            .padding()
            
            Text(character.name).font(.title).padding(.top, 8)
            
            HStack {
                InfoChip("\(character.affiliation) / \(character.gender)")
                InfoChip("KI \(character.ki)")
                InfoChip("Max KI \(character.maxKi)")
            }.padding(.top, 8)
            
            Text(character.description).font(.caption).padding(.top, 8)
        }
    }
}

struct InfoChip: View {
    
    private let info: String
    init(_ info: String) {
        self.info = info
    }
    
    var body: some View {
        Text(info)
            .font(.caption2)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.blue.opacity(0.1))
            .foregroundColor(.blue)
            .clipShape(Capsule())
    }
}

#Preview {
    CharactersScreen(viewModel: CharacterViewModel())
}
