//
//  UIImage+compressedImage.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/22/23.
//

import UIKit
extension UIImage{
    func compressedImage(ratio:CGFloat)->UIImage{
        let data = self.jpegData(compressionQuality: ratio)
        return UIImage(data: data!)!
    }
}
