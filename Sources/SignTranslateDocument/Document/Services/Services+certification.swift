//
//  Services+certification.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import Foundation

extension Services{
    
    
    struct Certification: ServiceProtocol{
        var isExpress: Bool = false
        var processed: Bool = false
        var requested: Bool = false
        var requestingForConfirmation:Bool = false
        var confirmed: Bool = false{
            didSet{
                chargeCost()
            }
        }
        var expressCost: Double = 30
        var standardCost: Double = 10

    }
    
    
}

