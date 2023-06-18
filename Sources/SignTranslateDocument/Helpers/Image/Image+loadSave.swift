//
//  Image+loadSave.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/6/23.
//

import Foundation
import SwiftUI


extension UIImage{
    static func saveImageURL(_ url: URL, key:String = "savedImageUrls") {
        var savedImageURLs = UserDefaults.standard.array(forKey: key) as? [URL] ?? []
        savedImageURLs.append(url)
        UserDefaults.standard.set(savedImageURLs, forKey: key)
    }
    static func getSavedImageURLs(key:String = "savedImageUrls") -> [URL] {
        let key = "savedImageURLs"
        return UserDefaults.standard.array(forKey: key) as? [URL] ?? []
    }

    static func loadImages(from urls: [URL]) -> [UIImage] {
        return urls.compactMap { url in
            guard let imageData = try? Data(contentsOf: url) else { return nil }
            return UIImage(data: imageData)
        }
    }
    

}

