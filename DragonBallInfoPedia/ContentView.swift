//
//  ContentView.swift
//  DragonBallInfoPedia
//
//  Created by Prateek on 06/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let repository = DragonBallDataRepository()
            do{
                let response = try await repository.getCharacters(page: 1, limit: 20)
                print("\(response)")
            }catch {
                print("Error")
            }
        }
    }
}

#Preview {
    ContentView()
}
