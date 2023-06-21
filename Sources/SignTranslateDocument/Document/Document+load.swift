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
    public func loadDocuments(userId:String) async throws-> [Document]{
        let database = Firestore.firestore()
        let userRef = database.collection("users").document(userId)
        let documentsRef = try await userRef.collection("documents").getDocuments()
        let documents = try documentsRef.documents.map({ try $0.data(as: Document.self) })
        return documents
    }
}
