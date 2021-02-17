//
//  Anime.swift
//  AnimeBook
//
//  Created by Özcan BIYIK on 7.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import Foundation
import UIKit

class Anime {
    
    var name : String
    var genre : String
    var image : UIImage
    
    init(name : String, genre : String, image : UIImage) {
        self.name = name
        self.genre = genre
        self.image = image
    }
    
}
