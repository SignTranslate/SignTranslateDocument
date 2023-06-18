//
//  Translation+codingKeys.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/30/23.
//

import SwiftUI

extension Services.Translation: Codable {
    enum CodingKeys: String, CodingKey {
        case isExpress, processed, requested, languagePair, expressCost, standardCost, legalDocsCost, requestingForConfirmation, deeplDocument, deeplStatus, deeplResult, confirmed, isLegalDocs, cost, translationPreviewImage
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isExpress = try container.decode(Bool.self, forKey: .isExpress)
        processed = try container.decode(Bool.self, forKey: .processed)
        requested = try container.decode(Bool.self, forKey: .requested)
        languagePair = try container.decode(Services.LanguagePair.self, forKey: .languagePair)
        expressCost = try container.decode(Double.self, forKey: .expressCost)
        standardCost = try container.decode(Double.self, forKey: .standardCost)
        legalDocsCost = try container.decode(Double.self, forKey: .legalDocsCost)
        requestingForConfirmation = try container.decode(Bool.self, forKey: .requestingForConfirmation)
        confirmed = try container.decode(Bool.self, forKey: .confirmed)
        isLegalDocs = try container.decode(Bool.self, forKey: .isLegalDocs)
        translationPreviewImage = decodeImage(from: container, forKey: .translationPreviewImage)
    }
    
    private func decodeImage(from container: KeyedDecodingContainer<CodingKeys>, forKey key: KeyedDecodingContainer<CodingKeys>.Key) -> UIImage? {
        if let b = try? container.decodeNil(forKey: key), b {
            return nil
        } else {
            if let data = try? container.decode(Data.self, forKey: key),
               let image = UIImage(data: data) {
                return image
            } else {
                return nil
            }
        }
    }
    private func encodeImage(_ image: UIImage?, to container: inout KeyedEncodingContainer<CodingKeys>, forKey key: KeyedEncodingContainer<CodingKeys>.Key) throws {
            if let data = image?.pngData() {
                try container.encode(data, forKey: key)
            } else {
                try container.encodeNil(forKey: key)
            }
        }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(isExpress, forKey: .isExpress)
        try container.encode(processed, forKey: .processed)
        try container.encode(requested, forKey: .requested)
        try container.encode(languagePair, forKey: .languagePair)
        try container.encode(expressCost, forKey: .expressCost)
        try container.encode(standardCost, forKey: .standardCost)
        try container.encode(legalDocsCost, forKey: .legalDocsCost)
        try container.encode(requestingForConfirmation, forKey: .requestingForConfirmation)
        try container.encode(confirmed, forKey: .confirmed)
        try container.encode(isLegalDocs, forKey: .isLegalDocs)
        try encodeImage(translationPreviewImage, to: &container, forKey: .translationPreviewImage)
    }
}
