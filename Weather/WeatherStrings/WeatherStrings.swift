import Foundation

protocol WeatherStringsProtocol {
    static var goToSettings: String { get set }
    static var weatherUnavailable: String { get set }
    static var fiveDayForecast: String { get set }
    static var hourlyForecast: String { get set }
    
    // MARK: Error Messages
    static var tryAgainTitle: String { get set }
    static var weatherErrorTitle: String { get set }
    static var networkUnavailable: String { get set }
    static var networkUnavailableDetail: String { get set }
}

public enum WeatherStrings: WeatherStringsProtocol {
    
    static var goToSettings: String = Localizable.localized(key: "GO_TO_SETTINGS")
    static var weatherUnavailable: String = Localizable.localized(key: "WEATHER_UNAVAILABLE")
    static var fiveDayForecast: String = Localizable.localized(key: "FIVE_DAY_FOCAST")
    static var hourlyForecast: String = Localizable.localized(key: "HOURLY_FOCAST")
    
    static var weatherErrorTitle = Localizable.localized(key: "WEATHER_ERROR_TITLE")
    static var tryAgainTitle = Localizable.localized(key: "TRY_AGAIN")
    static var networkUnavailable = Localizable.localized(key: "NETWORK_UNAVAILABLE")
    static var networkUnavailableDetail = Localizable.localized(key: "NETWORK_UNAVAILABLE_DETAIL")
}
