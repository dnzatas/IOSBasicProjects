//
//  MainViewController.swift
//  AnimalInfos
//
//  Created by deniz on 14.07.2023.
//

import UIKit
import AVKit
import AVFoundation

class MainViewController: UIViewController {

    @IBOutlet weak var cheetahView: AnimalView!
    @IBOutlet weak var elephantView: AnimalView!
    @IBOutlet weak var giraffeView: AnimalView!
    @IBOutlet weak var hippopotamusView: AnimalView!
    @IBOutlet weak var lionView: AnimalView!
    @IBOutlet weak var zebraView: AnimalView!
    @IBOutlet weak var ostrichView: AnimalView!
    @IBOutlet weak var gorillaView: AnimalView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        setupMyViews()
    }
    
    
    private func setupMyViews() {
        
        let cheetahVideoPath = "cheetah"
        let elephantVideoPath = "elephant"
        let giraffeVideoPath = "giraffe"
        let hippopotamusVideoPath = "hippopotamus"
        let lionVideoPath = "lion"
        let zebraVideoPath = "zebra"
        let ostrichVideoPath = "ostrich"
        let gorillaVideoPath = "gorilla"
        
        
        cheetahView.buttonClosure = { [weak self] in
            self?.playVideo(cheetahVideoPath)
        }
        elephantView.buttonClosure = { [weak self] in
            self?.playVideo(elephantVideoPath)
        }
        giraffeView.buttonClosure = { [weak self] in
            self?.playVideo(giraffeVideoPath)
        }
        hippopotamusView.buttonClosure = { [weak self] in
            self?.playVideo(hippopotamusVideoPath)
        }
        lionView.buttonClosure = { [weak self] in
            self?.playVideo(lionVideoPath)
        }
        zebraView.buttonClosure = { [weak self] in
            self?.playVideo(zebraVideoPath)
        }
        ostrichView.buttonClosure = { [weak self] in
            self?.playVideo(ostrichVideoPath)
        }
        gorillaView.buttonClosure = { [weak self] in
            self?.playVideo(gorillaVideoPath)
        }
        
        cheetahView.webLink = "https://en.wikipedia.org/wiki/Cheetah"
        elephantView.webLink = "https://en.wikipedia.org/wiki/Elephant"
        giraffeView.webLink = "https://en.wikipedia.org/wiki/Giraffe"
        gorillaView.webLink = "https://en.wikipedia.org/wiki/Gorilla"
        hippopotamusView.webLink = "https://en.wikipedia.org/wiki/Hippopotamus"
        lionView.webLink = "https://en.wikipedia.org/wiki/Lion"
        zebraView.webLink = "https://en.wikipedia.org/wiki/Zebra"
        ostrichView.webLink = "https://en.wikipedia.org/wiki/Common_ostrich"
        
        cheetahView.layer.contents = UIImage(named:"cheetah.png")?.cgImage
        elephantView.layer.contents = UIImage(named:"elephant.png")?.cgImage
        giraffeView.layer.contents = UIImage(named:"giraffe.png")?.cgImage
        gorillaView.layer.contents = UIImage(named:"gorilla.png")?.cgImage
        hippopotamusView.layer.contents = UIImage(named:"hippopotamus.png")?.cgImage
        lionView.layer.contents = UIImage(named:"lion.png")?.cgImage
        zebraView.layer.contents = UIImage(named:"zebra.png")?.cgImage
        ostrichView.layer.contents = UIImage(named:"ostrich.png")?.cgImage
        
        cheetahView.layer.cornerRadius = 16
        cheetahView.layer.masksToBounds = true
        elephantView.layer.cornerRadius = 16
        elephantView.layer.masksToBounds = true
        giraffeView.layer.cornerRadius = 16
        giraffeView.layer.masksToBounds = true
        gorillaView.layer.cornerRadius = 16
        gorillaView.layer.masksToBounds = true
        hippopotamusView.layer.cornerRadius = 16
        hippopotamusView.layer.masksToBounds = true
        lionView.layer.cornerRadius = 16
        lionView.layer.masksToBounds = true
        zebraView.layer.cornerRadius = 16
        zebraView.layer.masksToBounds = true
        ostrichView.layer.cornerRadius = 16
        ostrichView.layer.masksToBounds = true
        
        cheetahView.openWebAction = routeWebVC()
        elephantView.openWebAction = routeWebVC()
        giraffeView.openWebAction = routeWebVC()
        gorillaView.openWebAction = routeWebVC()
        hippopotamusView.openWebAction = routeWebVC()
        lionView.openWebAction = routeWebVC()
        ostrichView.openWebAction = routeWebVC()
    }
    
    
    func routeWebVC() -> (String) -> () {
        return {
            urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    
    
    func playVideo(_ videoPath: String) {
        guard let videoURL = Bundle.main.url(forResource: videoPath, withExtension: "mp4", subdirectory: "Videos") else {
            return
        }
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
                
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
    
}
