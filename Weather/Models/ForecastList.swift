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
    
    var temperature: String {
        guard let max = temp?.max, let min = temp?.min else { return "" }
        return "\(Int(min))ºC/\(Int(max))ºC"
    }
    
    var date: String {
        guard let date = dt else { return "" }
        let dateValue = date.dateFromInt
        return DateManager.day.stringFrom(date: Date()) == DateManager.day.stringFrom(date: dateValue)
        ? "Today"
        :  DateManager.day.stringFrom(date: dateValue)
    }

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity, weather, speed, deg, gust, clouds, pop, rain
    }
}
