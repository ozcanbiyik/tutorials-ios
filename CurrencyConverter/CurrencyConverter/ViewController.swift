//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Özcan BIYIK on 11.07.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        /**
         
         3 Adımımız var
         
         1) Request & Session (internete gidip, url'ye erişmek istemk yollamak)
         2) Response & Data (bu isteği almak)
         3) Parsing & JSON Serialization (istekten gelen datayı işlemek)
         
         */
        // 1 )
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=22e5c96c8e590ec6d97166c8684081f9")
        let session = URLSession.shared
        //Closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                // 2)
                if data != nil {
                    do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                        
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP : \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                                if let tryl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(tryl)"
                                }
                            }
                            
                        }
                        
                        
                    } catch {
                        print("Error")
                    }
                }
            }
        }
        task.resume()
    }
    
}

