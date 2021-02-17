//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by Özcan BIYIK on 11.01.2021.
//

import Foundation
import SwiftUI

struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElements]
}

struct FavoriteElements : Identifiable {
    var id = UUID()
    var name : String
    var imageName : String
    var description : String
}

let metallica = FavoriteElements(name: "Metallica", imageName: "metallica", description: "No.1 Music Band")
let megadeth = FavoriteElements(name: "Metallica", imageName: "Megadeth", description: "No.2 Music Band")
let ironmaiden = FavoriteElements(name: "Metallica", imageName: "Iron Maiden", description: "No.3 Music Band")

let favoriteBands = FavoriteModel(title: "Favorite Bands", elements: [metallica,megadeth,ironmaiden])
