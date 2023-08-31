//
//  JokeViewModel.swift
//  Jokes
//
//  Created by Thomas Garayua on 8/31/23.
//

import Foundation

class JokeViewModel: ObservableObject {
    @Published var joke: Joke?
    
    func fetchRandomJokeVM() {
        NetworkManager.shared.fetchRandomJoke { [weak self] jokes in
            DispatchQueue.main.async {
                self?.joke = jokes
            }
        }
    }
}
