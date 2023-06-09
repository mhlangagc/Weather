import Foundation

enum WeatherURLCenter {
    
    case weather(Location)
    case forecast(Location, Int)
    
    func buildURL() -> String {
        switch self {
        case .weather(let location):
            guard let lat = location.lat, let lon = location.lon else { return ""}
            return "\(AppConfigManager.secureApiProtocol)://\(AppConfigManager.openWeatherURI)/weather?lat=\(lat)&lon=\(lon)&appid=\(AppConfigManager.openWeatherKey)&units=metric"
        case .forecast(let location, let days):
            guard let lat = location.lat, let lon = location.lon else { return ""}
            return "\(AppConfigManager.secureApiProtocol)://\(AppConfigManager.openWeatherURI)/daily?lat=\(lat)&lon=\(lon)&cnt=\(days)&appid=\(AppConfigManager.openWeatherKey)&units=metric"
           
        }
    }
}
