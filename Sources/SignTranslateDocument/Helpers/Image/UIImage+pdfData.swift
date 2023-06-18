//
//  UIImage+pdfData.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import UIKit
import PDFKit

extension UIImage {
    var pdfData:Data {
        
        let pdfDocument = PDFDocument()
        let pdfPage = PDFPage(image: self)!
        pdfDocument.insert(pdfPage, at: 0)
        return pdfDocument.dataRepresentation()!
        
//        let pdfRendererFormat = UIGraphicsPDFRendererFormat()
//        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: self.size), format: pdfRendererFormat)
//
//        let data = pdfRenderer.pdfData { context in
//            context.beginPage()
//            self.draw(in: CGRect(origin: .zero, size: self.size))
//        }
//
//        return data
    }
}
