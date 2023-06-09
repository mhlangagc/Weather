import Foundation

struct ForecastList: Codable {
    var dt, sunrise, sunset: Int?
    var temp: Temp?
    var feelsLike: FeelsLike?
    var pressure, humidity: Int?
    var weather: [Weather]?
    var speed: Double?
    var deg: Int?
    var gust: Double?
    var clouds: Int?
    var pop, rain: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity, weather, speed, deg, gust, clouds, pop, rain
    }
}
