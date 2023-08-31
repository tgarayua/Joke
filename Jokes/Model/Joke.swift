//
//  Joke.swift
//  Jokes
//
//  Created by Thomas Garayua on 8/31/23.
//

import Foundation

struct Joke: Codable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}
