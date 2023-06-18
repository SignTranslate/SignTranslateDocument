//
//  Data+formData.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }

    mutating func appendPart(_ part: String, withName name: String, boundary: String) {
        append("--\(boundary)\r\n")
        append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        append("\(part)\r\n")
    }

    mutating func appendFileData(_ data: Data, withName name: String, fileName: String, mimeType: String, boundary: String) {
        append("--\(boundary)\r\n")
        append("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        append("Content-Type: \(mimeType)\r\n\r\n")
        append(data)
        append("\r\n")
    }

    mutating func closeMultipartFormData(boundary: String) {
        append("--\(boundary)--\r\n")
    }
    
}
