//
//  ViewController.swift
//  HesapMakinesi
//
//  Created by Özcan BIYIK on 29.06.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firsText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumClicked(_ sender: Any) {
        
        if let firstNumber = Int(firsText.text!){
            if let secondNumber = Int(secondText.text!){
                let result = firstNumber + secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    @IBAction func minusClicked(_ sender: Any) {
        
        if let firstNumber = Int(firsText.text!){
            if let secondNumber = Int(secondText.text!){
                let result = firstNumber - secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    @IBAction func multipleClicked(_ sender: Any) {
        
        if let firstNumber = Int(firsText.text!){
            if let secondNumber = Int(secondText.text!){
                let result = firstNumber * secondNumber
                resultLabel.text = String(result)
            }
        }
        
    }
    @IBAction func divideClicked(_ sender: Any) {
        
        if let firstNumber = Int(firsText.text!){
            if let secondNumber = Int(secondText.text!){
                let result = firstNumber / secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    
}

