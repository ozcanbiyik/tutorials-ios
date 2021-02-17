//
//  ViewController.swift
//  AnimeBook
//
//  Created by Özcan BIYIK on 7.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var animeArray = [Anime]()
    var chosenAnime : Anime?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Anime Objects
        
        let naruto = Anime(name: "Naruto", genre: "Shounen", image: UIImage(named: "naruto")!)
        let deathNote = Anime(name: "Death Note", genre: "Drama", image: UIImage(named: "death-note")!)
        let fullMetal = Anime(name: "Fullmetal Alchemist Brotherhood", genre: "Drama", image: UIImage(named: "fullmetal-alchemist")!)
        let hunter = Anime(name: "Hunter x Hunter", genre: "Shounen", image: UIImage(named: "hunter-x-hunter")!)
        
        animeArray.append(naruto)
        animeArray.append(deathNote)
        animeArray.append(fullMetal)
        animeArray.append(hunter)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = animeArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenAnime = animeArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedAnime = chosenAnime
        }
    }

}

