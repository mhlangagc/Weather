import Foundation

enum BaseURL {
    
    case weather
    
    func buildURL(withPath path: String) -> String {
        switch self {
        case .weather:
            let url = "\(AppConfigManager.secureApiProtocol)://\(AppConfigManager.openWeatherURI)/\(path)"
            return url
        }
    }
}
