////
////  ViewController.swift
////  FirebaseInstaClone
////
////  Created by Özcan BIYIK on 13.07.2020.
////  Copyright © 2020 Ozcan Biyik. All rights reserved.
////
//
////import UIKit
////import Firebase
////import Netmera
//
////class ViewController: UIViewController {
//
////    @IBOutlet weak var eMailTF: UITextField!
////    @IBOutlet weak var passwordTF: UITextField!
//
////    override func viewDidLoad() {
////        super.viewDidLoad()
//        // Do any additional setup after loading the view.
////    }
//
////    @IBAction func signInClicked(_ sender: Any) {
//
////        if eMailTF.text != "" && passwordTF.text != ""{
//
////            Auth.auth().signIn(withEmail: eMailTF.text!, password: passwordTF.text!) { (authdata, error) in
////                if error != nil {
////                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
////                } else {
////                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
// //               }
// //           }
//
////            let userNetmera = NetmeraUser()
//
//
//
// //           userNetmera.userId = eMailTF.text!
// //           userNetmera.state = passwordTF.text!
//
//
////            Netmera.update(userNetmera)
//
////            // **** Test ****
//
////            let event = NetmeraLoginEvent(userId: eMailTF.text)
////            Netmera.send(event!)
//
//
//
//
////        } else {
//
//            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
//
////        }
//
////    }
//
//    @IBAction func singUpClicked(_ sender: Any) {
//
//        if eMailTF.text != "" && passwordTF.text != "" {
//
//            Auth.auth().createUser(withEmail: eMailTF.text!, password: passwordTF.text!) { (authdata, error) in
//
//                if error != nil {
//
//                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
//
//                } else {
//
//                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
//
//                }
//
//            }
//
//        } else {
//
//            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
//
//        }
//
//    }
//
//    func makeAlert (titleInput:String, messageInput:String) {
//        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
//        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//        alert.addAction(okButton)
//        self.present(alert, animated: true, completion: nil)
//    }

//}
//

//
//  ViewController.swift
//  NetmeraSample
//
//  Created by inomera on 16.04.2020.
//  Copyright © 2020 Netmera. All rights reserved.
//

import UIKit
import Netmera

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let event2 = NetmeraLoginEvent()
        Netmera.send(event2)
        
        let userNetmera = NetmeraUser.init()
        
        userNetmera.userId = "emre"
        
        Netmera.update(userNetmera)
        
    }

}



