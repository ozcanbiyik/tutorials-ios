//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Özcan BIYIK on 3.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var isPikachu = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Görseli tıklanabilir yapıyoruz
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func changePic(){
        
        if (isPikachu == true){
            
            imageView.image = UIImage(named: "pikachu")
            imageLabel.text = "Pikachu"
            isPikachu = false
            
        } else {
            
            imageView.image = UIImage(named : "charmender")
            imageLabel.text = "Charmender"
            isPikachu = true
            
        }
        
    }


}

