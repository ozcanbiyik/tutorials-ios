//
//  InboxViewController.swift
//  FirebaseInstaClone
//
//  Created by Özcan BIYIK on 2.09.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import UIKit
import Netmera
import UIKit
import Netmera.NetmeraInbox

class InboxViewController : UIViewController {
    
  var inbox: NetmeraInbox?

    @IBOutlet weak var cell: UITableViewCell!
    // @IBOutlet var myTableView: UITableView!
//
// @IBOutlet weak var cell1: UICollectionViewCell!
//
// @IBOutlet weak var cell2: UICollectionViewCell!
  override func viewDidLoad() {
    
    let filter = NetmeraInboxFilter.init()
    filter.status = NetmeraInboxStatus.all
    filter.pageSize = 10
    filter.shouldIncludeExpiredObjects = true
//  filter.categories = ["spor"]
    
    Netmera.fetchInbox(using: filter, completion: {(_ netmeraInbox: NetmeraInbox, _ netmeraError: Error?) -> Void in
      if netmeraError != nil {
        print("error")
      }
      // Error : \(String(describing: (error as AnyObject).localizedDescription))
      self.inbox = netmeraInbox
//      self.myTableView.reloadData()
      let json = NetmeraPushObject.init()
        
      print("Json: " , json.customDictionary)
        
      let jsonTwo = Netmera.recentPushObject()?.customDictionary
        
      print("JsonTwo :" , jsonTwo)
      print("Body:" , Netmera.recentPushObject()?.alert.body)
        
      print("Inbox Status = \(String(describing: Netmera.recentPushObject()?.inboxStatus))")
      print("Include In Inbox = \(String(describing: Netmera.recentPushObject()?.includedInInbox))")
        
    })
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return inbox!.objects.count
  }
}
