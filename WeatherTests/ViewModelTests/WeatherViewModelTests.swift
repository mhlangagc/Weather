//
//  WeatherNetworkControllerTests.swift
//  WeatherTests
//
//  Created by Gugulethu Mhlanga on 2023/06/14.
//

import Foundation
import XCTest
import CoreLocation
@testable import Weather

final class WeatherViewModelTests: XCTestCase {
    
    private var delegateMock: WeatherViewModelDelegateMock?
    private var viewModelUnderTest: WeatherViewModel?
    var mockNetworkService: MockNetworkService?
    
    var locationManager: CLLocationManager?
    var mockLocation: Location?
    
    override func setUp() {
        super.setUp()
        DependencyContainer.registerDefaults()
        mockNetworkService = MockNetworkService.shared
        delegateMock = WeatherViewModelDelegateMock()
        mockLocation = ConvertJsonToModel.convert(fromFile: "MockLocation")
        viewModelUnderTest = WeatherViewModel()
        viewModelUnderTest?.delegate = delegateMock
    }
    
    override func tearDown() {
        super.tearDown()
        DependencyContainer.reset()
        mockNetworkService = nil
        viewModelUnderTest = nil
        mockLocation = nil
    }
    
    func testFetchWeatherData() {
        self.mockNetworkService?.weatherDataFetch = true
        self.viewModelUnderTest?.fetchWeatherData(from: mockLocation!)
        print(self.delegateMock!.hideLoaderInvoked)
        XCTAssertTrue(self.delegateMock!.hideLoaderInvoked)
//        XCTAssertTrue(self.delegateMock!.showTableViewInvoked)
//        XCTAssertTrue(self.delegateMock!.weatherDataFetched)
    }
    
    func testFetchWeatherDataFail() {
        self.mockNetworkService?.weatherDataFetchFailed = true
        self.viewModelUnderTest?.fetchWeatherData(from: mockLocation!)
        XCTAssertTrue(self.delegateMock!.hideLoaderInvoked)
//        XCTAssertTrue(self.delegateMock!.showErrorInvoked)
//        XCTAssertEqual(self.delegateMock!.apiError, "")
    }
    
    func testFetchForecastData(from location: Location) {
        
    }

}
