import Foundation

protocol WeatherStringsProtocol {
    static var goToSettings: String { get set }
    static var weatherUnavailable: String { get set }
    static var fiveDayForecast: String { get set }
    static var hourlyForecast: String { get set }
}

public enum WeatherStrings: WeatherStringsProtocol {
    static var goToSettings: String = Localizable.localized(key: "GO_TO_SETTINGS")
    static var weatherUnavailable: String = Localizable.localized(key: "WEATHER_UNAVAILABLE")
    static var fiveDayForecast: String = Localizable.localized(key: "FIVE_DAY_FOCAST")
    static var hourlyForecast: String = Localizable.localized(key: "HOURLY_FOCAST")
}
