//
//  NoneBaseEventTest.swift
//  FirebaseInstaClone
//
//  Created by Özcan BIYIK on 12.08.2020.
//  Copyright © 2020 Ozcan Biyik. All rights reserved.
//

import Netmera

let kNoneBaseEventTestKey: String = "ykg"

class NoneBaseEventTest: NetmeraEvent {

    @objc var boolNbase: Bool = false
    @objc var dateNbase: Date?
    @objc var doubleNbase: Double = 0.0
    @objc var longNbase: Int = 0
    @objc var timestampNbase: Date?
    @objc var stringNbase: String = ""
    @objc var intNbase: [Int] = []
    override class func keyPathPropertySelectorMapping() -> [AnyHashable: Any] {
        return[
            "fg": NSStringFromSelector(#selector(getter: self.boolNbase)),
            "fi": NSStringFromSelector(#selector(getter: self.dateNbase)),
            "el": NSStringFromSelector(#selector(getter: self.doubleNbase)),
            "fq": NSStringFromSelector(#selector(getter: self.longNbase)),
            "gb": NSStringFromSelector(#selector(getter: self.timestampNbase)),
            "ea": NSStringFromSelector(#selector(getter: self.stringNbase)),
            "ec": NSStringFromSelector(#selector(getter: self.intNbase))
        ]
    }

    override var eventKey : String {
        return kNoneBaseEventTestKey
    }
}
