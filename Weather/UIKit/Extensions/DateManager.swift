import Foundation

@frozen enum DateManager: String {

    case day = "EEEE"

    func stringFrom(date: Date) -> String {
        let dateFormatter = DateFormatter()
        switch self {
        case .day:
            dateFormatter.dateFormat = DateManager.day.rawValue
        }
        return dateFormatter.string(from: date)
    }
}
