import XCTest
@testable import Weather

final class DateManagerTest: XCTestCase {
    
    private lazy var mockDate = Date(timeIntervalSince1970: 946684800)
    private let expectedResult = "Saturday"
    
    func testDateFromInt() {
        XCTAssertEqual(expectedResult, DateManager.day.stringFrom(date: mockDate))
    }
}
