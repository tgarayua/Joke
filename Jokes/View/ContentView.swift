//
//  ContentView.swift
//  Jokes
//
//  Created by Thomas Garayua on 8/31/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var sizeClass
    @StateObject private var viewModel = JokeViewModel()
    @State private var showPunchline = false
    
    var body: some View {
        
        ZStack {
            if colorScheme == .dark {
                Image("DarkBackground")
                    .resizable()
                    .ignoresSafeArea()
            } else {
                Image("LightBackground")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            if sizeClass == .compact {
                VStack {
                    if let joke = viewModel.joke {
                        Spacer()
                        
                        Image("Dad Joke Logo")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        Text(joke.setup)
                            .font(.title2)
                            .padding()
                        
                        if showPunchline {
                            
                            Spacer()
                            
                            Text(joke.punchline)
                                .font(.title)
                                .padding()
                                .scaleEffect(showPunchline ? 1.0 : 0.2)
                            
                            Spacer()
                            
                            Button("Get new joke!") {
                                viewModel.fetchRandomJokeVM()
                                showPunchline = false
                            }
                            .padding()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .background(.orange)
                            .cornerRadius(10)
                            .shadow(color: .yellow, radius: 15, y: 5)
                            
                            Spacer()
                        } else {
                            VStack {
                                Spacer()
                                Button("🥊 Punch Line...") {
                                    withAnimation {
                                        showPunchline.toggle()
                                    }
                                }
                                .padding()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .background(.orange)
                                .cornerRadius(10)
                                .shadow(color: .yellow, radius: 15, y: 5)
                                
                                Spacer()
                                
                                Button("Get new joke!") {
                                    viewModel.fetchRandomJokeVM()
                                    showPunchline = false
                                }
                                .padding()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .background(.orange)
                                .cornerRadius(10)
                                .shadow(color: .yellow, radius: 15, y: 5)
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    } else {
                        Spacer()
                        
                        Image("Dad Joke Logo")
                            .renderingMode(.original)
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 200, height: 200)
                        Spacer()
                        Text("Welcome to Dad Joke!")
                            .font(.title)
                            .padding()
                        Text("Press Button To Get A Joke")
                            .font(.title3)
                        
                        Spacer()
                        
                        Button("Get a joke!") {
                            viewModel.fetchRandomJokeVM()
                        }
                        .padding()
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(.orange)
                        .cornerRadius(10)
                        .shadow(color: .yellow, radius: 15, y: 5)
                        
                        Spacer()
                    }
                }
            } else {
                HStack {
                    if let joke = viewModel.joke {
                        Spacer()
                        
                        Image("Dad Joke Logo")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        Spacer()
                        
                        if showPunchline {
                            VStack {
                                Text(joke.setup)
                                    .font(.title2)
                                    .padding()
                                
                                Text(joke.punchline)
                                    .font(.title)
                                    .padding()
                                    .scaleEffect(showPunchline ? 1.0 : 0.2)
                            }
                            
                            Spacer()
                            
                            Button("Get new joke!") {
                                viewModel.fetchRandomJokeVM()
                                showPunchline = false
                            }
                            .padding()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .background(.orange)
                            .cornerRadius(10)
                            .shadow(color: .yellow, radius: 15, y: 5)
                            
                            Spacer()
                            
                        } else {
                            Text(joke.setup)
                                .font(.title2)
                                .padding()
                            
                            VStack {
                                Spacer()
                                Button("🥊 Punch Line...") {
                                    withAnimation {
                                        showPunchline.toggle()
                                    }
                                }
                                .padding()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .background(.orange)
                                .cornerRadius(10)
                                .shadow(color: .yellow, radius: 15, y: 5)
                                
                                Spacer()
                                
                                Button("Get new joke!") {
                                    viewModel.fetchRandomJokeVM()
                                    showPunchline = false
                                }
                                .padding()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .background(.orange)
                                .cornerRadius(10)
                                .shadow(color: .yellow, radius: 15, y: 5)
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    } else {
                        Spacer()
                        
                        Image("Dad Joke Logo")
                            .renderingMode(.original)
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 200, height: 200)
                        Spacer()
                        
                        VStack {
                            Text("Welcome to Dad Joke!")
                                .font(.title)
                                .padding()
                            Text("Press Button To Get A Joke")
                                .font(.title3)
                        }
                        
                        Spacer()
                        
                        Button("Get a joke!") {
                            viewModel.fetchRandomJokeVM()
                        }
                        .padding()
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(.orange)
                        .cornerRadius(10)
                        .shadow(color: .yellow, radius: 15, y: 5)
                        
                        Spacer()
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
