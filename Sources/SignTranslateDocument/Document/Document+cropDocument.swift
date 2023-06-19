//
//  Document+cropDocument.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/7/23.
//

import Foundation
import UIKit
import Vision
extension Document{
    public func cropDocument(from inputImage: UIImage, completion: @escaping (UIImage?) -> Void) {
        guard let cgImage = inputImage.cgImage else {
            completion(nil)
            return
        }
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNDetectRectanglesRequest { (request, error) in
            guard let results = request.results as? [VNRectangleObservation],
                  let rectObservation = results.first else {
                completion(nil)
                return
            }
            
            let croppedImage = cropImage(inputImage, rectObservation: rectObservation)
            completion(croppedImage)
        }
        
        request.minimumAspectRatio = VNAspectRatio(1.0)
        request.maximumAspectRatio = VNAspectRatio(2.0)
        request.minimumSize = Float(0.5)
        request.maximumObservations = 1
        
        do {
            try requestHandler.perform([request])
        } catch {
            print("Error performing request: \(error.localizedDescription)")
            completion(nil)
        }
    }

    public func cropImage(_ image: UIImage, rectObservation: VNRectangleObservation) -> UIImage? {
        guard let ciImage = CIImage(image: image) else { return nil }
        
        let topLeft = rectObservation.topLeft.scaled(to: image.size)
        let topRight = rectObservation.topRight.scaled(to: image.size)
        let bottomLeft = rectObservation.bottomLeft.scaled(to: image.size)
        let bottomRight = rectObservation.bottomRight.scaled(to: image.size)

        let ciImageWithPerspectiveCorrection = ciImage.applyingFilter("CIPerspectiveCorrection", parameters: [
            "inputTopLeft": CIVector(cgPoint: topLeft),
            "inputTopRight": CIVector(cgPoint: topRight),
            "inputBottomLeft": CIVector(cgPoint: bottomLeft),
            "inputBottomRight": CIVector(cgPoint: bottomRight)
        ])

        let context = CIContext()
        guard let outputCGImage = context.createCGImage(ciImageWithPerspectiveCorrection, from: ciImageWithPerspectiveCorrection.extent) else { return nil }
        return UIImage(cgImage: outputCGImage)
    }
}
extension CGPoint {
    public func scaled(to size: CGSize) -> CGPoint {
        return CGPoint(x: x * size.width, y: (1 - y) * size.height)
    }
}
