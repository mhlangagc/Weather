import UIKit
import Foundation
import XCTest
@testable import Weather

final class IntExtensionTest: XCTestCase {
    
    private let mockDate = Date(timeIntervalSince1970: 946684800)
    private let mockIntDate = 946684800
    
    func testDateFromInt() {
        XCTAssertEqual(mockDate, mockIntDate.dateFromInt)
    }
}
