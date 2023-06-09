import Foundation

struct OpenWeather: Codable {
    var coord: Location?
    var weather: [Weather]?
    var base: String?
    var main: FullWeatherData?
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

// MARK: - Coord
struct Location: Codable {
    var lon, lat: Double?
}

// MARK: - Main
struct FullWeatherData: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity, seaLevel, grndLevel: Int?
    
    var averageTemp: String {
        guard let temp = temp else { return "" }
        return "\(Int(temp))º"
    }
    
    var highLowDescription: String {
        guard let tempMax = tempMax, let tempMin = tempMin else { return "" }
        return "\(Int(tempMax))º/\(Int(tempMin))º"
    }

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    var type, id: Int?
    var country: String?
    var sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int?
    var main, description, icon: String?
}

// MARK: - Wind
struct Wind: Codable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}
