//
//  SplashView.swift
//  Jokes
//
//  Created by Thomas Garayua on 8/31/23.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                if colorScheme == .dark {
                    Image("DarkBackground")
                        .resizable()
                        .ignoresSafeArea()
                } else {
                    Image("LightBackground")
                        .resizable()
                        .ignoresSafeArea()
                }
                VStack {
                    Image("Dad Joke Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
