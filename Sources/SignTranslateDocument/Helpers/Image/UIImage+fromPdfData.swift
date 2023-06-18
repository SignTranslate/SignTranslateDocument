//
//  UIImage+fromPdfData.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/23/23.
//

import PDFKit
import UIKit
extension UIImage{
    static func fromPdfData(data:Data)->UIImage?{
        guard let pdfPage = PDFDocument(data: data)?.page(at: 0) else {return nil}
        let pdfImage = pdfPage.thumbnail(of: pdfPage.bounds(for: .mediaBox).size, for: .mediaBox)
        return pdfImage
    }
}
