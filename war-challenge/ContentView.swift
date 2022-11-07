//
//  ContentView.swift
//  war-challenge
//
//  Created by Himanshu Singh Malik on 02/1/22.
//

import SwiftUI

struct ContentView: View {
    // dataTypes
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    // main body
    var body: some View {
        // Create the background to add up other functions over it.
        ZStack{
            // used .ignoreSafeArea() to expand over on the complete screen
            Spacer()
            Image("background").ignoresSafeArea()
            // creating vertical stack which contains all the elements
            
            VStack{
                // Logo, HStack with 2 cards, image element represent the deal button, score Vstack in Hstack
                // Logo of the game
                Spacer()
                Image("logo")
                Spacer()
                // 2 cards
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                // deal button
                Spacer()
                Button(action: {
                    
                    // Generate randon no b/w 2 & 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    // Update the scores
                    if(playerRand > cpuRand){
                        playerScore += 1
                    }
                    else if(playerRand < cpuRand){
                        cpuScore += 1
                    }
                    else if(playerRand == cpuRand){
                        cpuScore += 1
                        playerScore += 1
                    }
                    
                }, label: {Image("dealbutton")})
                
                Spacer()
                HStack{
                    // Score board
                    Spacer()
                    VStack{
                        Text("PLAYER")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
