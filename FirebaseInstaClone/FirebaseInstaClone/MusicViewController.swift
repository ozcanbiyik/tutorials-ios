//
//  MusicViewController.swift
//  FirebaseInstaClone
//
//  Created by Özcan BIYIK on 12.08.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit
import Netmera

class MusicViewController: UIViewController {
    

    @IBAction func musicClicked(_ sender: Any) {
        
        print("Play Music")
        
        print(NetmeraProduct.version())
        
        /*
        
        let noneBase = NoneBaseEventTest.init()
        noneBase.boolNbase = true
        noneBase.intNbase = [1903,1905,2020]
        noneBase.dateNbase = Date()
        
        Netmera.send(noneBase)
        
        */
        
        let _months = MyNetmeraUser.init()
        _months.months = 2
        Netmera.update(_months)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
