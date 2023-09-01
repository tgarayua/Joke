//
//  NetworkManager.swift
//  Jokes
//
//  Created by Thomas Garayua on 8/31/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let jokeApiUrl = "https://official-joke-api.appspot.com/random_joke"
    private init() {}
    
    func fetchRandomJoke(completion: @escaping (Joke?) -> Void) {
        guard let url = URL(string: jokeApiUrl) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error in URLSession: ", error.localizedDescription)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let randomJoke = try decoder.decode(Joke.self, from: data)
                    completion(randomJoke)
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
