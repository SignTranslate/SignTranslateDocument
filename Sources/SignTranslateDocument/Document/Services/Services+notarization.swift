//
//  Services+notarization.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import Foundation
extension Services{
    public struct Notarization: ServiceProtocol{
        public var processed: Bool = false
        public var requested: Bool = false
        public var expressCost: Double = 30
        public var standardCost: Double = 10
        public var requestingForConfirmation:Bool = false
        public var confirmed: Bool = false
        public var isExpress:Bool = false
        
        public var cost:Double{
            get{
                standardCost + (isExpress ? expressCost: 0.0)
            }
        }
        
        public init(){}
        
        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<Services.Notarization.CodingKeys> = try decoder.container(keyedBy: Services.Notarization.CodingKeys.self)
            self.processed = try container.decode(Bool.self, forKey: Services.Notarization.CodingKeys.processed)
            self.requested = try container.decode(Bool.self, forKey: Services.Notarization.CodingKeys.requested)
            self.expressCost = try container.decode(Double.self, forKey: Services.Notarization.CodingKeys.expressCost)
            self.standardCost = try container.decode(Double.self, forKey: Services.Notarization.CodingKeys.standardCost)
            self.requestingForConfirmation = try container.decode(Bool.self, forKey: Services.Notarization.CodingKeys.requestingForConfirmation)
            self.confirmed = try container.decode(Bool.self, forKey: Services.Notarization.CodingKeys.confirmed)
            self.isExpress = try container.decode(Bool.self, forKey: Services.Notarization.CodingKeys.isExpress)
        }
        public init(processed: Bool, requested: Bool, expressCost: Double, standardCost: Double, requestingForConfirmation: Bool, confirmed: Bool, isExpress: Bool) {
            self.processed = processed
            self.requested = requested
            self.expressCost = expressCost
            self.standardCost = standardCost
            self.requestingForConfirmation = requestingForConfirmation
            self.confirmed = confirmed
            self.isExpress = isExpress
        }
    }
}
