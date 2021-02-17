//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Özcan BIYIK on 2.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // App açılınca ilk gelen fonksiyon.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting - as? vs. as!(force casting)
        
        if let newName = storedName as? String{
            nameLabel.text = newName
        }
        
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = newBirthday
        }
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday")
        // eski kodlar içersinde standart.synchorinze() diye bir şey görürsen, o artık kullanılmıyor.
        
        
        nameLabel.text = " Name : \(nameTextField.text!)"
        birthdayLabel.text = " Birthday : \(birthdayTextField.text!)"
        
    }
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = " Name : "
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = " Birthday : "
        }
        
    }
    
}

