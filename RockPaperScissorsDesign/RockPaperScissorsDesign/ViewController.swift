//
//  ViewController.swift
//  RockPaperScissorsDesign
//
//  Created by deniz on 9.07.2023.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var cmpScoreLabel: UILabel!
    @IBOutlet weak var moveAlert: UILabel!
    
    
    enum Options: String, CaseIterable {
        case rock = "👊🏼"
        case paper = "✋🏼"
        case scissors = "✌🏼"
    }
    
    var userScore = 0
    var cmpScore = 0
    var userChoice:Options?
    var cmpChoice:Options?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.layer.cornerRadius = 20
        moveAlert.layer.cornerRadius = 20
        rockButton.layer.cornerRadius = rockButton.frame.width/2
        paperButton.layer.cornerRadius = rockButton.frame.width/2
        scissorsButton.layer.cornerRadius = rockButton.frame.width/2
        rockButton.layer.masksToBounds = true
        paperButton.layer.masksToBounds = true
        scissorsButton.layer.masksToBounds = true
        stackView.layer.masksToBounds = true
        moveAlert.layer.masksToBounds = true
    }
    
    
    
    private func computerChoice() -> Options{
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
                    cmpScore += 1
                    return "Computer win!"
                }else if cmpChoice == .scissors{
                    userScore += 1
                    return "You win! 🎉"
                }else {
                    return "Drawn!"
                }
            case .paper:
                if cmpChoice == .scissors{
                    cmpScore += 1
                    return "Computer win!"
                }else if cmpChoice == .rock{
                    userScore += 1
                    return "You win! 🎉"
                }else {
                    return "Drawn!"
                }
                
            case .scissors:
                if cmpChoice == .rock{
                    cmpScore += 1
                    return "Computer win!"
                }else if cmpChoice == .paper{
                    userScore += 1
                    return "You win! 🎉"
                }else {
                    return "Drawn!"
                }
        }
    }
    
    
    
    
    @IBAction func rockButtonAct(_ sender: Any) {
        cmpChoice = computerChoice()
        userChoice = .rock
        let winner = detectWinner(userChoice!, cmpChoice!)
        userScoreLabel.text = "Your Score: \(userScore)"
        cmpScoreLabel.text = "Computer Score: \(cmpScore)"
        performSegue(withIdentifier: "gotoresult", sender: winner)
    }
    
    
    @IBAction func paperButtonAct(_ sender: Any) {
        cmpChoice = computerChoice()
        userChoice = .paper
        let winner = detectWinner(userChoice!, cmpChoice!)
        userScoreLabel.text = "Your Score: \(userScore)"
        cmpScoreLabel.text = "Computer Score: \(cmpScore)"
        performSegue(withIdentifier: "gotoresult", sender: winner)
    }
    
    
    @IBAction func scissorsButton(_ sender: Any) {
        cmpChoice = computerChoice()
        userChoice = .scissors
        let winner = detectWinner(userChoice!, cmpChoice!)
        userScoreLabel.text = "Your Score: \(userScore)"
        cmpScoreLabel.text = "Computer Score: \(cmpScore)"
        performSegue(withIdentifier: "gotoresult", sender: winner)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoresult" {
            let secVC = segue.destination as! SecondVC
            let winner = sender as? String
            secVC.resultText = winner
            secVC.userChoiceText = userChoice!.rawValue
            secVC.cmpChoiceText = cmpChoice!.rawValue
        }
    }
    
    
    @IBAction func playAgainAct(_ sender: Any) {
        userScoreLabel.text = "Your Score: 0"
        cmpScoreLabel.text = "Computer Score: 0"
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 202.0/255.0, green: 235.0/255.0, blue: 253.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 126.0/255.0, green: 227.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }


}

