//
//  Document+codable.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/21/23.
//

import SwiftUI

// Document
extension Document: Codable {
    enum CodingKeys: CodingKey {
        case id, name, date, services, image, editedImage, processedImage, docsType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(Date.self, forKey: .date)
        services = (try? container.decode(Services.self, forKey: .services)) ?? Services()
        
        let imageData = try container.decode(Data.self, forKey: .image)
        image = UIImage(data: imageData) ?? UIImage(systemName: "person.fill.questionmark")!
        
        let editedImageData = try container.decode(Data.self, forKey: .editedImage)
        editedImage = UIImage(data: editedImageData) ?? UIImage(systemName: "person.fill.questionmark")!
        
        let processedImageData = (try? container.decode(Data.self, forKey: .processedImage)) ?? Data()
        processedImage = UIImage(data: processedImageData)
        
        docsType = try container.decode(DocsType.self, forKey: .docsType)

    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(date, forKey: .date)
        try container.encode(services, forKey: .services)
        
        if let imageData = image.pngData(){ try container.encode(imageData, forKey: .image) }
        if let editedImageData = editedImage.pngData(){ try container.encode(editedImageData, forKey: .editedImage) }
        if let processedImageData = processedImage?.pngData(){ try container.encode(processedImageData, forKey: .processedImage) }
        try container.encode(docsType, forKey: .docsType)
    }
}
