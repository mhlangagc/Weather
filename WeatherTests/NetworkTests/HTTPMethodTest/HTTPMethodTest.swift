import XCTest
@testable import Weather

final class HTTPMethodTest: XCTestCase {
    
    func testHttpMethods() {
        XCTAssertEqual("CONNECT", HTTPMethod.connect.rawValue)
        XCTAssertEqual("DELETE", HTTPMethod.delete.rawValue)
        XCTAssertEqual("GET", HTTPMethod.get.rawValue)
        XCTAssertEqual("HEAD", HTTPMethod.head.rawValue)
        XCTAssertEqual("OPTIONS", HTTPMethod.options.rawValue)
        XCTAssertEqual("PATCH", HTTPMethod.patch.rawValue)
        XCTAssertEqual("POST", HTTPMethod.post.rawValue)
        XCTAssertEqual("PUT", HTTPMethod.put.rawValue)
        XCTAssertEqual("QUERY", HTTPMethod.query.rawValue)
        XCTAssertEqual("TRACE", HTTPMethod.trace.rawValue)
    }
}
