//
//  Services.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//



public struct Services:Codable{
    public static var example = Services()
    public var notarization = Notarization()
    public var translation = Translation()
    public var certification = Certification()
}

