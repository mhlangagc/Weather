import Foundation
import XCTest
@testable import Weather

final class WeatherStringsTests: XCTestCase, WeatherStringsProtocol {
    
    static var goToSettings: String  = "Go To Settings"
    static var weatherUnavailable: String = "Weather App is unavailable\n\nWeather App requires permission to access your current location, you can turn this function on in settings."
    static var fiveDayForecast: String = "5-Day Forecast"
    static var hourlyForecast: String = "Hourly Forecast"
    static var weatherErrorTitle: String = "Weather Error"
    static var networkUnavailable: String = "Network Unavailable"
    static var networkUnavailableDetail: String = "Your network is unreachable. Check your settings and try again"
    static var tryAgainTitle: String = "Try Again"
    
    func testWeatherStrings() {
        XCTAssertEqual(WeatherStringsTests.goToSettings, WeatherStrings.goToSettings)
        XCTAssertEqual(WeatherStringsTests.weatherUnavailable, WeatherStrings.weatherUnavailable)
        XCTAssertEqual(WeatherStringsTests.fiveDayForecast, WeatherStrings.fiveDayForecast)
        XCTAssertEqual(WeatherStringsTests.hourlyForecast, WeatherStrings.hourlyForecast)
        XCTAssertEqual(WeatherStringsTests.weatherErrorTitle, WeatherStrings.weatherErrorTitle)
        XCTAssertEqual(WeatherStringsTests.networkUnavailable, WeatherStrings.networkUnavailable)
        XCTAssertEqual(WeatherStringsTests.networkUnavailableDetail, WeatherStrings.networkUnavailableDetail)
        XCTAssertEqual(WeatherStringsTests.tryAgainTitle, WeatherStrings.tryAgainTitle)
    }
}
