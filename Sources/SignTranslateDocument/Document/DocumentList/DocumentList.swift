//
//  DocumentList.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/8/23.
//

import Foundation
import Combine
class DocumentList:ObservableObject{
    static var shared = DocumentList(documents: DocumentList.load())
    
    private var saveCancellable: AnyCancellable?
    private var autoSaveCancellable: AnyCancellable?
    private let saveDelay: TimeInterval = 2.0 // Adjust the delay as needed

    init(documents: [Document]){
        self.documents = documents
        self.saveCancellable = $documents
                   .debounce(for: .seconds(saveDelay), scheduler: DispatchQueue.main)
                   .sink { _ in
                       self.save()
                   }
        self.autoSaveCancellable = Timer.publish(every: 2, on: .current, in: .default)
            .debounce(for: .seconds(2), scheduler: DispatchQueue.global())
            .sink(receiveValue: { _ in
                self.save()
            })
    }
    @Published var documents:[Document]{
        didSet {
            saveCancellable = $documents
                            .debounce(for: .seconds(saveDelay), scheduler: DispatchQueue.main)
                            .sink { _ in
                                self.save()
                            }
        }
    }
    @Published var newDocs = Document(id: UUID(), name: "", date: Date.now)
    public func refreshDocs(){
        newDocs = Document(id: UUID(), name: "", date: Date.now)
    }
    public func saveNew(){
        documents.append(newDocs)
        refreshDocs()
    }
}



