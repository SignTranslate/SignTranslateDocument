//
//  Services.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//



public struct Services:Codable{
    static var example = Services()
    var notarization = Notarization()
    var translation = Translation()
    var certification = Certification()
}

