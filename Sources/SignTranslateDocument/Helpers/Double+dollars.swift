//
//  Double+dollars.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//

import Foundation
extension Double{
    public var dollars:String{
        String(format: "$ %.2f", self)
    }
}
