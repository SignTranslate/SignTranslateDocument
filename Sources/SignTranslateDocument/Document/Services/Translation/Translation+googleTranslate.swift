//
//  Translation+googleTranslate.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import SwiftUI
extension Services.Translation {
    
    public func translateText(_ text: String, sourceLanguage: String, targetLanguage: String) async throws -> String {
        let apiKey = "AIzaSyDrP4_OF8Km1Poog8w25iRJ1igUnHo7iGY"
        let baseUrl = "https://translation.googleapis.com/language/translate/v2"
        
        let params: [String: Any] = [
            "q": text,
            "source": sourceLanguage,
            "target": targetLanguage,
            "key": apiKey
        ]
        
        var components = URLComponents(string: baseUrl)
        components?.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        guard let url = components?.url else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to construct the request URL."])
        }
        
        var request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(TranslationResponse.self, from: data)
        
        guard let translatedText = response.data.translations.first?.translatedText else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse translation response."])
        }
        
        return translatedText
    }
    public struct TranslationResponse: Codable {
        struct Translation: Codable {
            let translatedText: String
        }
        
        struct Data: Codable {
            let translations: [Translation]
        }
        
        let data: Data
    }

}

