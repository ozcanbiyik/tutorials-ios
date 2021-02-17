//
//  ViewController.swift
//  Pokedex
//
//  Created by Özcan BIYIK on 6.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokeNames = [String]()
    var pokeImages = [UIImage]()
    
    var chosenPokeNames = ""
    var chosenPokeImages = UIImage()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Pokedex Data
        
        pokeNames.append("Gastly")
        pokeNames.append("Pikachu")
        pokeNames.append("Charmender")
        
        pokeImages.append(UIImage(named: "gastly")!)
        pokeImages.append(UIImage(named: "pikachu")!)
        pokeImages.append(UIImage(named: "charmender")!)
        
        navigationItem.title = "POKEDEX"
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pokeNames.remove(at: indexPath.row)
            pokeImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = pokeNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenPokeNames = pokeNames[indexPath.row]
        chosenPokeImages = pokeImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedPokeName = chosenPokeNames
            destinationVC.selectedPokeImage = chosenPokeImages
        }
    }


}

