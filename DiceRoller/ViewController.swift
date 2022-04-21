//
//  ViewController.swift
//  DiceRoller
//
//  Created by Mali on 16.04.2022.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    var audioPlayer: AVAudioPlayer?
    
    var imageNames = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var images = [UIImage]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rollDice()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userInterFace = traitCollection.userInterfaceStyle
        
        if userInterFace == .dark {
            titleLabel.textColor = UIColor.white
        } else {
            titleLabel.textColor = UIColor.white
        }
    }
    
    func rollDice() {
        
        var sayi1 = arc4random_uniform(UInt32(6))+1
        var sayi2 = arc4random_uniform(UInt32(6))+1
        imageView1.image = UIImage(named: "dice\(sayi1)")
        imageView2.image = UIImage(named: "dice\(sayi2)")
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let pathToSound = Bundle.main.path(forResource: "diceSound", ofType: "wav")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                animatedImages()
                rollDice()
            }
            catch{
                print(error)
            }
            
            
            
        }
    }
    
    func animatedImages() {
        
        for i in 0...5 {
            images.append(UIImage(named: imageNames[i])!)
        }
        // Animations
        imageView1.animationImages = images
        imageView1.animationDuration = 0.27
        imageView1.animationRepeatCount = 7
        imageView1.startAnimating()
        imageView2.animationImages = images
        imageView2.animationDuration = 0.27
        imageView2.animationRepeatCount = 7
        imageView2.startAnimating()
        
        
    }


}

