//
//  Int+hex.swift
//  SignTranslate
//
//  Created by nic wanavit on 6/7/23.
//

import Foundation
extension Int{
    var hex:String{
        String(format: "%02x", self)
    }
}

extension UInt8{
    var hex:String{
        String(format: "%02x", self)
    }
}
