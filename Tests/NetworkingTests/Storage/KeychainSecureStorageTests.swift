import XCTest
@testable import Networking

final class KeychainSecureStorageTests: XCTestCase {
    
    // MARK: - Properties
    private var storage: KeychainSecureStorage!
}

// MARK: - Setup
extension KeychainSecureStorageTests {
    
    override func setUp() {
        super.setUp()
        
        storage = KeychainSecureStorage(key: "tests")
    }
    
    override func tearDown() {
        super.tearDown()
        
        storage.clear()
        storage = nil
    }
}

// MARK: - Tests
extension KeychainSecureStorageTests {
    
    func testStorage_willStoreValueAndReadValue_andDeleteValueCorrectly() {
        
        let key = "testKey"
        let value = "testValue"
        
        XCTAssertNil(storage[key])
        storage[key] = value
        
        XCTAssertEqual(storage[key], value)
        storage[key] = nil
        
        XCTAssertNil(storage[key])
    }
}
