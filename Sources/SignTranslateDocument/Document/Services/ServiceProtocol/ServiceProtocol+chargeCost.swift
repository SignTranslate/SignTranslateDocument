//
//  ServiceProtocol+chargeCost.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import Foundation
import Foundation
extension ServiceProtocol{

    func chargeCost(){
        DispatchQueue.main.async {
            UserBalance.standard.balance -= self.cost
        }
    }
}

