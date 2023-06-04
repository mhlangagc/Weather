import Foundation

enum WeatherURLCenter {
    case business
    
    func build() -> String {
        switch self {
        case .business:
            return "business"
        }
    }
}
