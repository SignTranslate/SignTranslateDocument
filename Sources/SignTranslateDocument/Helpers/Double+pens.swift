//
//  Double+pens.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/30/23.
//

extension Double{
    public var pens:String{
        String(format: "\(String().pen) %.2f", self)
    }
}

