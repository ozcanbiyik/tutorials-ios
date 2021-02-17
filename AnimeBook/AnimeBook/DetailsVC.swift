//
//  DetailsVC.swift
//  AnimeBook
//
//  Created by Özcan BIYIK on 7.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedAnime : Anime?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedAnime?.name
        jobLabel.text = selectedAnime?.genre
        imageView.image = selectedAnime?.image
        
        // Do any additional setup after loading the view.
    }
    
}
