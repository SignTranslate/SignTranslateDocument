//
//  ServiceProtocol+chargeCost.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import Foundation
import Foundation
extension ServiceProtocol{
    
    typealias ServiceCost = Double
    public func chargeCost(callback: @escaping (ServiceCost)->Void){
        DispatchQueue.main.async {
            callback(self.cost)
        }
    }
}

