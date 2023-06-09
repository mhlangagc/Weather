import Foundation

extension Int {
    var dateFromInt: Date {
        Date(timeIntervalSince1970: TimeInterval(integerLiteral: Int64(self)))
    }
}
