import Foundation

struct OpenWeather: Codable {
    var coord: Location?
    var weather: [Weather]?
    var base: String?
    var main: WeatherData?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: Sys?
    var timezone, id: Int?
    var name: String?
    var cod: Int?
    
    var weatherDescription: String {
        if let description = weather?.first?.main,
           let weatherData = main?.highLowDescription {
            return description + " " + weatherData
        }
        return ""
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    var all: Int?
}


// MARK: - Sys
struct Sys: Codable {
    var type, id: Int?
    var country: String?
    var sunrise, sunset: Int?
}
