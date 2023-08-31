//
//  ContentView.swift
//  Jokes
//
//  Created by Thomas Garayua on 8/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JokeViewModel()
    
    var body: some View {
        
        ZStack {
            Image("TanBackground")
               .renderingMode(.original)  // << here !!
               .resizable()
               .ignoresSafeArea()
            VStack {
                
                if let joke = viewModel.joke {
                    Text(joke.setup)
                    Text(joke.punchline)
                    
                    Button("Get new joke!") {
                        viewModel.fetchRandomJokeVM()
                    }
                    .padding()
                } else {
                    Button("Get a joke!") {
                        viewModel.fetchRandomJokeVM()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
