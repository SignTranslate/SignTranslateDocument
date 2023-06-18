//
//  UIImage+cgImage.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/29/23.
//

import UIKit
extension UIImage {
    var cgImageRepresentation: CGImage? {
        if let cgImage = self.cgImage {
            return cgImage
        } else if let ciImage = self.ciImage {
            let context = CIContext(options: nil)
            return context.createCGImage(ciImage, from: ciImage.extent)
        } else {
            return nil
        }
    }
}
