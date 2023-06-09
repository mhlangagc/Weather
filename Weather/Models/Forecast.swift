import Foundation

struct Forecast: Codable {
    var city: City?
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list: [ForecastList]?
}

struct FeelsLike: Codable {
    var day, night, eve, morn: Double?
}

struct Temp: Codable {
    var day, min, max, night: Double?
    var eve, morn: Double?
}
