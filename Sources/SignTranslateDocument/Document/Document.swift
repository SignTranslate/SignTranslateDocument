//
//  Document.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/6/23.
//

import Foundation
import SwiftUI




public struct Document: Identifiable {
    public let id: UUID
    public var name: String
    public var date: Date
//    var previewImage: UIImage = UIImage(named: "placeholder")!
    public var services: Services = Services()
    public var image: UIImage = UIImage(named: "phDocs")!
    public var editedImage: UIImage = UIImage(named: "phDocs")!
    public var processedImage:UIImage? = nil
    public var docsType:DocsType = .contract

    public enum DocsType: String, CaseIterable{
        case contract = "contract/agreements"
        case id = "ID card"
        case passport = "passport"
        case bankStatement = "bank statement"
        case utilityBills = "utility bills"
        case birthCertificate = "birth certificate"
        case educationCertificate = "education certificate"
        case otherCertificate = "certificates"
        case letters = "letters"
        case others = "others"
    }
    
    public var previewImage: UIImage{
        if let processedImage = processedImage{
            return processedImage
        }
        return editedImage
    }
    
    public static let example = [
        Document(id: UUID(), name: "Document 1", date: Date()),
        Document(id: UUID(), name: "Document 2", date: Date().addingTimeInterval(-3600)),
        Document(id: UUID(), name: "Document 3", date: Date().addingTimeInterval(-7200))
    ]
}



extension Document:Hashable{
    public static func == (lhs: Document, rhs: Document) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.date)
        hasher.combine(self.name)
    }
}
