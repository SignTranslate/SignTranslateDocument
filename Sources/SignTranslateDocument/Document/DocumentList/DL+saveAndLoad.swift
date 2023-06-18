//
//  DL+saveAndLoad.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/21/23.
//

import Foundation
// DocumentList saving and loading
extension DocumentList {
    private static let userDefaultsKey = "documentList"
    private static let documentsFileName = "documents.json"
    static var documentsFileURL: URL {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            return documentsDirectory.appendingPathComponent(DocumentList.documentsFileName)
        }
    
    func save() {
        Task(priority: .low) {
            do {
                let data = try JSONEncoder().encode(self.documents)
                try data.write(to: DocumentList.documentsFileURL, options: [.atomic])
                print("data is saved")
            } catch {
                print("Error saving documents: \(error)")
            }
        }
    }
    
    static func load() -> [Document] {
        do {
            let data = try Data(contentsOf: DocumentList.documentsFileURL)
            let decodedDocuments = try JSONDecoder().decode([Document].self, from: data)
            return decodedDocuments
        } catch {
            debugPrint("error loading docs", error)
            return Document.example
        }
    }
}
