//
//  ContentView.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharactersScreen(viewModel: CharacterViewModel())
    }
}

#Preview {
    ContentView()
}
