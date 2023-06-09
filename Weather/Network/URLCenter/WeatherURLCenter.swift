import Foundation

enum WeatherURLCenter {
    
    case weather(Location)
    
    func buildURL() -> String {
        switch self {
        case .weather(let location):
            guard let lat = location.lat, let lon = location.lon else { return ""}
            return "\(AppConfigManager.secureApiProtocol)://\(AppConfigManager.openWeatherURI)/weather?lat=\(lat)&lon=\(lon)&appid=\(AppConfigManager.openWeatherKey)&units=metric"
           
        }
    }
}
