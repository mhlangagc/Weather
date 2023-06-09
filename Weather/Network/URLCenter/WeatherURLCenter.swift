import Foundation

enum WeatherURLCenter {
    case weather
    
    func build() -> String {
        switch self {
        case .weather:
            return "weather"
        }
    }
}
