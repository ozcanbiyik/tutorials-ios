//
//  MyNetmeraUser.swift
//  FirebaseInstaClone
//
//  Created by Özcan BIYIK on 12.08.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import Netmera

class MyNetmeraUser : NetmeraUser {
    enum NetmeraProfileAttributeMonths : Int {
        case ocak = 0
        case Şubat = 1
        case mart = 2
    };

    @objc var months: Int = 0

    override class func keyPathPropertySelectorMapping() -> [AnyHashable: Any] {
        return[
            "mz" : NSStringFromSelector(#selector(getter: self.months)),
        ]
    }
}
