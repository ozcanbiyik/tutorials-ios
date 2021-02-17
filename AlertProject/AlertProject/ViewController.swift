//
//  ViewController.swift
//  AlertProject
//
//  Created by Özcan BIYIK on 3.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var rePasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if (userNameTF.text == ""){
            makeAlert(titleInput: "Error", messageInput: "Username not found !")
        }else if(passwordTF.text == ""){
            makeAlert(titleInput: "Error", messageInput: "Password not found !")
        }else if(passwordTF.text != rePasswordTF.text){
            makeAlert(titleInput: "Error", messageInput: "Passwords dont match !")
        }else{
            makeAlert(titleInput: "Success", messageInput: "User OK")
        }
        
    }
    
    func makeAlert(titleInput : String, messageInput : String){
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

#imageLiteral(resourceName: "Ekran Resmi 2020-09-30 23.48.52.png")
