//
//  ContentLike.swift
//  FirebaseInstaClone
//
//  Created by Özcan BIYIK on 11.08.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import Netmera

let kContentLikeKey: String = "wyy"

class ContentLike: NetmeraProductRateEvent {

    @objc var likePost: String = ""
    override class func keyPathPropertySelectorMapping() -> [AnyHashable: Any] {
        return[
            "ee": NSStringFromSelector(#selector(getter: self.likePost))
        ]
    }

    override var eventKey : String {
        return kContentLikeKey
    }
}
