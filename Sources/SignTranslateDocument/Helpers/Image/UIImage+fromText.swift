import UIKit

extension UIImage {
    public enum ImageCreationError: Error {
        case failedToCreateImage
    }

    public static func from(text: String, fontSize: CGFloat) throws -> UIImage {
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


