import UIKit

extension UIImage {
    enum ImageCreationError: Error {
        case failedToCreateImage
    }

    static func from(text: String, fontSize: CGFloat) throws -> UIImage {
        // Define A4 size at 72 PPI
        let size = CGSize(width: 595, height: 842)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set() // Transparent background
        UIRectFill(CGRect(origin: .zero, size: size))
        
        // Set the font color/attributes
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize),
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        
        // Define the text area
        let textRect = CGRect(x: 50, y: 50, width: size.width - 100, height: size.height - 100)
        
        // Draw the text into the image
        text.draw(in: textRect, withAttributes: attributes)
        
        // Create a new UIImage
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            throw ImageCreationError.failedToCreateImage
        }
        UIGraphicsEndImageContext()
        
        // Return the new image
        return newImage
    }
}




//import UIKit
//
//extension UIImage {
//    enum ImageCreationError: Error {
//        case failedToCreateImage
//    }
//
//    static func from(text: String, fontSize: CGFloat) throws -> UIImage {
//        // Define the context size based on the text size.
//        let textSize = text.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])
//        let size = CGSize(width: textSize.width + 50, height: textSize.height + 20) // + some padding
//
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        UIColor.clear.set() // Transparent background
//        let rect = CGRect(origin: .zero, size: size)
//        UIRectFill(rect)
//
//        // Set the font color/attributes
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: fontSize),
//            .foregroundColor: UIColor.black
//        ]
//
//        // Draw the text into the image
//        text.draw(in: rect, withAttributes: attributes)
//
//        // Create a new UIImage
//        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
//            UIGraphicsEndImageContext()
//            throw ImageCreationError.failedToCreateImage
//        }
//        UIGraphicsEndImageContext()
//
//        // Return the new image
//        return newImage
//    }
//}
