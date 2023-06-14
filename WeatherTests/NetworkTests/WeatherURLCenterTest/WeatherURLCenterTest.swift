import XCTest
@testable import Weather

final class WeatherURLCenterTest: XCTestCase {
    
    var mockLocation: Location? {
        return ConvertJsonToModel.convert(fromFile: "MockLocation")
    }
    
    var mockNumberOfFocastDays: Int {
        return 5
    }

    func testWeatherEndPoint() {
        guard let location = mockLocation else { return }
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/weather?lat=-29.62319&lon=28.2334698&appid=53f9d8e4213222cf517d86dc406d67fc&units=metric",
                       WeatherURLCenter.weather(location).buildURL())
    }
    
    func testFocastPoint() {
        guard let location = mockLocation else { return }
        XCTAssertEqual("https://api.openweathermap.org/data/2.5/forecast/daily?lat=-29.62319&lon=28.2334698&cnt=5&appid=53f9d8e4213222cf517d86dc406d67fc&units=metric",
                       WeatherURLCenter.forecast(location, mockNumberOfFocastDays).buildURL())
    }
}

