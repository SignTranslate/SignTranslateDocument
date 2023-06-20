//
//  Services.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/10/23.
//



public struct Services:Codable{
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.notarization = try container.decode(Services.Notarization.self, forKey: .notarization)
        self.translation = try container.decode(Services.Translation.self, forKey: .translation)
        self.certification = try container.decode(Services.Certification.self, forKey: .certification)
    }
    public init(){
        notarization = Notarization()
        translation = Translation()
        certification = Certification()
    }
    
    public var notarization = Notarization()
    public var translation = Translation()
    public var certification = Certification()
    public static var example = Services()
}

