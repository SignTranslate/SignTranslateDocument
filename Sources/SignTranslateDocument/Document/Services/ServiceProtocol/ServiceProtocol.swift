//
//  Service.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import Foundation
import SwiftUI
protocol ServiceProtocol: Codable{
    var requested:Bool {get set}
    var processed:Bool {get set}
    var requestingForConfirmation:Bool {get set}
    var isExpress:Bool {get set}
    var expressCost:Double { get set}
    var standardCost:Double { get set}
    var confirmed:Bool {get set}
}

