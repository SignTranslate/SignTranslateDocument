//
//  Services+certification.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import Foundation

extension Services{
    
    
    public struct Certification: ServiceProtocol{
        public var isExpress: Bool = false
        public var processed: Bool = false
        public var requested: Bool = false
        public var requestingForConfirmation:Bool = false
        public var confirmed: Bool = false
        public var expressCost: Double = 30
        public var standardCost: Double = 10

    }
    
    
}

