//
//  ServiceProtocol+chargeCost.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import Foundation
import Foundation
extension ServiceProtocol{

    func chargeCost(callback: @escaping (Double)->Void){
        DispatchQueue.main.async {
            callback(self.cost)
        }
    }
}

