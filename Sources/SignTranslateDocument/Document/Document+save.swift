//
//  File.swift
//  
//
//  Created by nic wanavit on 6/21/23.
//

import Foundation
import FirebaseStorage
import Firebase
import FirebaseFirestoreSwift
extension Document{

    public func saveDocument(document: Document, userId: String) async throws {
        let database = Firestore.firestore()
        let userRef = database.collection("users").document(userId)
        let documentRef = userRef.collection("documents").document(document.id.uuidString)
        try await documentRef.setDataAsync(from: document)
    }
    public func save(userId:String) async throws{
        try await saveDocument(document: self, userId: userId)
    }
}
extension DocumentReference{
    func setDataAsync(from: some Encodable)async throws{
        return try await withCheckedThrowingContinuation { continuation in
            do{
                try self.setData(from: from, merge: true) { error in
                    guard error == nil else { continuation.resume(throwing: error!); return}
                    continuation.resume()
                }
            } catch{
                continuation.resume(throwing: error)
            }
        }
    }

}
