//
//  CharacterDetailsScreen.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 07/11/25.
//

import SwiftUI

struct CharacterDetailsScreen : View {
    
    @StateObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        if let character = viewModel.character {
            ScrollView{
                VStack(alignment: .leading){
                    if let imageUrl = character.image {
                        ZStack(alignment: .bottom) {
                            
                            Ellipse()
                                .fill(Color.gray.opacity(0.3))
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .padding(.horizontal, 48)
                                .offset(y: 16)
                            
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 360)
                            .frame(maxWidth: .infinity)
                            .padding()
                        }.padding(.bottom, 32)
                        
                        Text(character.name).font(.title3).fontWeight(.bold).foregroundColor(.blue)
                        
                        HStack{
                            if let race = character.race {
                                InfoChip(race)
                            }
                            if let gender = character.gender {
                                InfoChip(gender)
                            }
                            InfoChip("KI \(character.ki)")
                            InfoChip("Max KI \(character.maxKi)")
                        }.padding(.vertical, 8)
                        
                        if let description = character.description {
                            Text(description)
                        }
                        
                        if let originPlanet = character.originPlanet {
                            Text("Origin planet - \(originPlanet.name)")
                                .font(.headline)
                                .foregroundColor(Color.blue)
                                .padding(.top, 24)
                            
                            
                            AsyncImage(url: URL(string: originPlanet.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .padding()
                            
                        }
                        
                        if !character.transformations.isEmpty {
                            Text("Transformations")
                                .font(.headline)
                                .foregroundColor(Color.blue)
                                .padding(.top, 24)
                            
                            
                            
                            TabView {
                                ForEach(character.transformations) { transformation in
                                    VStack(alignment: .leading) {
                                        if let transformationImage = transformation.image {
                                            
                                            Text (transformation.name).font(.title3)
                                            Text (transformation.ki).font(.callout)
                                            
                                            ZStack(alignment: .bottom) {
                                                Ellipse()
                                                    .fill(Color.gray.opacity(0.3))
                                                    .frame(width: 180, height: 60)
                                                    .padding(.horizontal, 48)
                                                    .offset(y: 8)
                                                
                                                AsyncImage(url: URL(string: transformationImage)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                .frame(height: 260)
                                                .frame(maxWidth: .infinity)
                                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                                .padding()
                                            }.padding(.bottom, 16)
                                            
                                        }
                                    }
                                }
                            }.tabViewStyle(.page).frame(height: 380)
                        
                        }
                        
                    }
                }.padding()
            }.navigationTitle(character.name)
        }else {
            ProgressView().navigationTitle("")
        }
    }
}

#Preview {
    NavigationStack{
        CharacterDetailsScreen(viewModel: CharacterDetailsViewModel(id: 2))
    }
}
