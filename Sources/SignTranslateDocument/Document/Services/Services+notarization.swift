//
//  Services+notarization.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import Foundation
extension Services{
    struct Notarization: ServiceProtocol{
        var processed: Bool = false
        var requested: Bool = false
        var expressCost: Double = 30
        var standardCost: Double = 10
        var requestingForConfirmation:Bool = false
        var confirmed: Bool = false {
            didSet{
                chargeCost()
            }
        }
        var isExpress:Bool = false
    }
}
