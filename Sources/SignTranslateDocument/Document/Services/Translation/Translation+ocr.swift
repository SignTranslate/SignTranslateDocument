//
//  Translation+ocr.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import SwiftUI
import Vision
extension Services.Translation{
    public func performOCR(_ image: UIImage, language:String) async throws -> String {
        // Create a new image-request handler.
        guard let cgImage = image.cgImage else {
            throw OCRProcessingError.invalidImage
        }
        let requestHandler = VNImageRequestHandler(
            cgImage: cgImage, options: [:]
        )

        // Create a new request to recognize text.
        let request = VNRecognizeTextRequest()
        request.recognitionLevel = .accurate
        request.recognitionLanguages = [
            language,
            "en-US"
        ]
        request.automaticallyDetectsLanguage = true
        request.usesLanguageCorrection = true
        print(try request.supportedRecognitionLanguages())

        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            throw OCRProcessingError.recognitionFailed
        }

        guard let observations = request.results else {
            throw OCRProcessingError.invalidResults
        }

        var recognizedStrings = [String]()
        for observation in observations {
            guard let topCandidate = observation.topCandidates(1).first else {
                continue
            }
            recognizedStrings.append(topCandidate.string)
        }

        let result = recognizedStrings.joined(separator: "\n")
        print("ocr strings are ", result)
        return result
    }

    public enum OCRProcessingError: Error {
        case textRecognitionNotAvailable
        case invalidImage
        case recognitionFailed
        case invalidResults
    }
}
