//
//  UIImage+pdfData.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import UIKit
import PDFKit

extension UIImage {
    public var pdfData:Data {
        
        let pdfDocument = PDFDocument()
        let pdfPage = PDFPage(image: self)!
        pdfDocument.insert(pdfPage, at: 0)
        return pdfDocument.dataRepresentation()!

    }
}
