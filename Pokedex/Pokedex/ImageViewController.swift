//
//  ImageViewController.swift
//  Pokedex
//
//  Created by Özcan BIYIK on 6.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    
    var selectedPokeName = ""
    var selectedPokeImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeNameLabel.text = selectedPokeName
        imageView.image = selectedPokeImage
        
    }
    
    
    
}
