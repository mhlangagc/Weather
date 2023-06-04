import Foundation

protocol WeatherStringsProtocol {
    static var goToSettings: String { get set }
    static var weatherUnavailable: String { get set }
    static var fiveDayForecast: String { get set }
    static var hourlyForecast: String { get set }
}

public enum WeatherStrings: WeatherStringsProtocol {
    static var goToSettings: String = "Go To Settings"
    static var weatherUnavailable: String = "Weather App is unavailable\n\nWeather App requires permission to access your current location, you can turn this function on in settings."
    static var fiveDayForecast: String = "5-Day Forecast"
    static var hourlyForecast: String = "Hourly Forecast"
}
