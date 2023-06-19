import XCTest
@testable import SignTranslateDocument

final class SignTranslateDocumentTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SignTranslateDocument().text, "Hello, World!")
        let document = Document(id: UUID(), name: "test", date: Date.now)
        
    }
    
}
