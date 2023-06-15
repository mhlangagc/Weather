import Foundation
import XCTest
import CoreLocation
@testable import Weather

final class WeatherViewModelTests: XCTestCase {
    
    private var delegateMock: WeatherViewModelDelegateMock!
    private var viewModelUnderTest: WeatherViewModel!
    var mockNetworkService: MockNetworkService!
    var mockLocation: Location!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        delegateMock = WeatherViewModelDelegateMock()
        mockLocation = ConvertJsonToModel.convert(fromFile: "MockLocation")
        viewModelUnderTest = WeatherViewModel(delegate: delegateMock, networkService: mockNetworkService)
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetworkService = nil
        viewModelUnderTest = nil
        mockLocation = nil
    }
    
    func testFetchWeatherData() {
        self.mockNetworkService.weatherDataFetch = true
        self.viewModelUnderTest.getWeatherData(from: mockLocation)
        XCTAssertTrue(self.delegateMock.showLoaderInvoked)
    }
    
    func testFetchWeatherDataFail() {
        self.mockNetworkService.weatherDataFetchFailed = true
        self.viewModelUnderTest.getWeatherData(from: mockLocation)
        XCTAssertTrue(self.delegateMock.showErrorInvoked)
    }
    
    func testFetchForecastData(from location: Location) {
        self.mockNetworkService.forecastDataFetch = true
        self.viewModelUnderTest.getForecastData(from: mockLocation)
        XCTAssertTrue(self.delegateMock.showLoaderInvoked)
    }
    
    func testFetchForecastDataFail() {
        self.mockNetworkService.forecastDataFetchFailed = true
        self.viewModelUnderTest.getWeatherData(from: mockLocation)
        XCTAssertTrue(self.delegateMock.showErrorInvoked)
    }

}
