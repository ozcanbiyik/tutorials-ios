//
//  ViewController.swift
//  CatchThePokeballGame
//
//  Created by Özcan BIYIK on 4.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // V a r i a b l e s
    
    var score = 0
    var highScore = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var pokeArray = [UIImageView]()
    
    // V i e w s

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var poke1: UIImageView!
    @IBOutlet weak var poke2: UIImageView!
    @IBOutlet weak var poke3: UIImageView!
    @IBOutlet weak var poke4: UIImageView!
    @IBOutlet weak var poke5: UIImageView!
    @IBOutlet weak var poke6: UIImageView!
    @IBOutlet weak var poke7: UIImageView!
    @IBOutlet weak var poke8: UIImageView!
    @IBOutlet weak var poke9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score : \(score)"
        
        // Highscore check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil{
            highScore = 0
            highscoreLabel.text = "Highscore : \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore : \(highScore)"
        }
        
        poke1.isUserInteractionEnabled = true
        poke2.isUserInteractionEnabled = true
        poke3.isUserInteractionEnabled = true
        poke4.isUserInteractionEnabled = true
        poke5.isUserInteractionEnabled = true
        poke6.isUserInteractionEnabled = true
        poke7.isUserInteractionEnabled = true
        poke8.isUserInteractionEnabled = true
        poke9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(inceraseScore))
        
        poke1.addGestureRecognizer(recognizer1)
        poke2.addGestureRecognizer(recognizer2)
        poke3.addGestureRecognizer(recognizer3)
        poke4.addGestureRecognizer(recognizer4)
        poke5.addGestureRecognizer(recognizer5)
        poke6.addGestureRecognizer(recognizer6)
        poke7.addGestureRecognizer(recognizer7)
        poke8.addGestureRecognizer(recognizer8)
        poke9.addGestureRecognizer(recognizer9)
        
        pokeArray = [poke1, poke2, poke3, poke4, poke5, poke6, poke7, poke8, poke9]
        
        // T i m e r s
        
        /**
                timeInterval : kaç saniyede bir ne yapacağımız
                target : nereden çağıralacak
                selector : yeni bir fonksiyon oluştur
                userInfo : gerek yok (nil)
                repeats : tekrar ediyor mu ? (y/n)
         */
        
        counter = 10
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidePoke), userInfo: nil, repeats: true)
        
        hidePoke()
        
    }
    
    @objc func hidePoke(){
        for poke in pokeArray{
            poke.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(pokeArray.count-1)))
        pokeArray[random].isHidden = false
        
    }

    @objc func inceraseScore(){
        score += 1
        scoreLabel.text = "Score : \(score)"
    }
    
    @objc func countDown(){
    
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            // durdurur
            timer.invalidate()
            hideTimer.invalidate()
            
            for poke in pokeArray{
                poke.isHidden = true
            }
            
            // HighScore
            
            if self.score > self.highScore {
                self.highScore = self.score
                highscoreLabel.text = "Highscore : \(highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            
            // alert
            
            let alert = UIAlertController(title: "Time's Over", message: "Do u want to play again ?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButtton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                // replay function
                
                self.score = 0
                self.scoreLabel.text = "Score : \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidePoke), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButtton)
            // alerti göstermek
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }

}

