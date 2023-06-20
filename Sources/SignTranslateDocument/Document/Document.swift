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
    public var services: Services
    public var image: UIImage
    public var editedImage: UIImage
    public var processedImage:UIImage?
    public var docsType:DocsType
    public init(
        id: UUID,
        name: String,
        date: Date,
        services: Services = Services(),
        image: UIImage = UIImage(named: "phDocs")!,
        editedImage: UIImage = UIImage(named: "phDocs")!,
        processedImage: UIImage? = nil,
        docsType: DocsType = .contract) {
        self.id = id
        self.name = name
        self.date = date
        self.services = services
        self.image = image
        self.editedImage = editedImage
        self.processedImage = processedImage
        self.docsType = docsType
    }

    public enum DocsType: String, CaseIterable, Codable{
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
