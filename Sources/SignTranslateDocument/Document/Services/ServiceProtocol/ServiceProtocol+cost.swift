//
//  ServiceProtocol+chargeCost.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import Foundation
extension ServiceProtocol{
    var cost:Double{
        get{
            standardCost + (isExpress ? expressCost: 0.0)
        }
    }

}

