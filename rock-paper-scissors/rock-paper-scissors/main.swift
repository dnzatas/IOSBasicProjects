//
//  main.swift
//  rock-paper-scissors
//
//  Created by deniz on 19.06.2023.
//

import Foundation

class RockPaperScissors{
    
    enum Options: String, CaseIterable {
        case rock = "rock"
        case paper = "paper"
        case scissors = "scissors"
    }
    
    func myChoice() -> Options {
        print("Enter your choice (ROCK, PAPER, SCISSORS): ")
        let userInput = readLine()?.lowercased()
        guard let myOption = Options(rawValue: userInput!) else {
            fatalError("Invalid Option")
        }
        return myOption
    }
    
    func computerChoice() -> Options{
        let allOptions = Options.allCases
        guard let randomOption = allOptions.randomElement() else {
            fatalError("Computer couldn't choise")
        }
        return randomOption
    }
    
    func detectWinner(_ myChoice: Options, _ cmpChoice:Options) -> String{
        switch myChoice{
        case .rock:
            if cmpChoice == .paper{
                return "Computer win!"
            }else if cmpChoice == .scissors{
                return "You win! 🎉"
            }else {
                return "Drawn!"
            }
        case .paper:
            if cmpChoice == .scissors{
                return "Computer win!"
            }else if cmpChoice == .rock{
                return "You win! 🎉"
            }else {
                return "Drawn!"
            }
            
        case .scissors:
            if cmpChoice == .rock{
                return "Computer win!"
            }else if cmpChoice == .paper{
                return "You win! 🎉"
            }else {
                return "Drawn!"
            }
        }
    }
    
    func playGame(){
        let computerChoise = computerChoice()
        let userChoice = myChoice()
        let winnerResult = detectWinner(userChoice, computerChoise)
        print("Computer Choise: \(computerChoise), Your Choice: \(userChoice)")
        print(winnerResult)
    }
}


var rpc = RockPaperScissors()
rpc.playGame()


