//
//  Translation+ocrTranslate.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import SwiftUI
extension Services.Translation{
    public func ocrTranslate(image:UIImage, sourceLanguage:String, targetLanguage:String)async throws->String{
        let recognizedText = try await performOCR(image, language: sourceLanguage)
        let translatedText = try await translateText(recognizedText, sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)
        return translatedText
    }
    public func ocrTraslateToImg(image:UIImage, sourceLanguage:String, targetLanguage:String)async throws->UIImage{
        let recognizedText = try await performOCR(image, language: sourceLanguage)
        let translatedText = try await translateText(recognizedText, sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)
        return try UIImage.from(text: translatedText, fontSize: 20)
    }
}
