//
//  String+coins.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//

import Foundation
extension Double{
    var coins:String{
        String(format: "\(String().coin) %.2f", self)
    }
}

