//
//  SecondVC.swift
//  RockPaperScissorsDesign
//
//  Created by deniz on 9.07.2023.
//

import UIKit

class SecondVC: UIViewController {

    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var userChoiceLabel: UILabel!
    @IBOutlet weak var cmpChoiceLabel: UILabel!
    
    
    var resultText:String?
    var userChoiceText:String?
    var cmpChoiceText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let resultText, let userChoiceText, let cmpChoiceText {
            resultLabel.text = "\(resultText)"
            userChoiceLabel.text = "Your Choice: \(userChoiceText)"
            cmpChoiceLabel.text = "Computer Choice: \(cmpChoiceText)"
        }

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
