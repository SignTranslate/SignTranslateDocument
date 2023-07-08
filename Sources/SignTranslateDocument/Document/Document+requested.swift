//
//  File.swift
//  
//
//  Created by nic wanavit on 7/8/23.
//

import Foundation
extension Document{
    var serviceRequested:Bool{
        let notarization = services.notarization
        guard !notarization.requested else {return true}
        let certification = services.certification
        guard !certification.requested else {return true}
        let translation = services.translation
        guard !translation.requested else {return true}
        return false
    }
}
