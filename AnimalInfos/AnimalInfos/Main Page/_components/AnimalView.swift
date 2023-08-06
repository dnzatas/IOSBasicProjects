//
//  AnimalView.swift
//  AnimalInfos
//
//  Created by deniz on 14.07.2023.
//

import UIKit

class AnimalView: UIView {
    
    var webLink: String?
    var videoPath: String?
    var openWebAction: ((_ urlString: String) -> ())?
    var buttonClosure: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    
    private func setupView() {
        if let viewForXib = Bundle.main.loadNibNamed("AnimalView", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            addSubview(viewForXib)
        }
        //self.backgroundColor = UIColor(patternImage: UIImage(named: "zebra.png")!)
        
    }
    
    @IBAction func watchVideoAct(_ sender: Any) {
        buttonClosure?()
    }
    
    @IBAction func goLinkAct(_ sender: Any) {
        openWebAction?(webLink!)
        
    }
}
