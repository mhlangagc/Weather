import Foundation

struct WeatherData: Codable {
    var temp, feelsLike, tempMin, tempMax: Double?
    var pressure, humidity, seaLevel, grndLevel: Int?
    
    var averageTemp: String {
        guard let temp = temp else { return "" }
        return "\(Int(temp))º"
    }
    
    var highLowDescription: String {
        guard let tempMax = tempMax, let tempMin = tempMin else { return "" }
        return "\(Int(tempMin))ºC/\(Int(tempMax))ºC"
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
